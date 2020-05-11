//
//  ErgastAPI.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

/// Public interface of functions for fetching Formula 1 data from the Ergast REST API.
public enum ErgastAPI {
    
    /// Fetches Formula 1 Circuits for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). 
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func circuits<T: Decodable>(for season: SeasonYear,
                                              completion: @escaping (Result<T, ErgastAPIError>) -> Void) {
        
        URLSession.shared.fetch(.circuits,
                               for: season) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Circuits for all seasons throughout history.
    /// - Parameter completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func allCircuits<T: Decodable>(completion: @escaping (Result<T, ErgastAPIError>) -> Void) {
        
        URLSession.shared.fetch(.circuits,
                               for: nil) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Seasons throughout history.
    /// - Parameter completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func seasons<T: Decodable>(completion: @escaping (Result<T, ErgastAPIError>) -> Void) {
        
        URLSession.shared.fetch(.seasons) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Constructors for all seasons throughout history.
    /// - Parameter completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func allConstructors<T: Decodable>(completion: @escaping (Result<T, ErgastAPIError>) -> Void) {
        
        URLSession.shared.fetch(.constructors) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Constructors for all seasons throughout history.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func constructors<T: Decodable>(for season: SeasonYear,
                                                  completion: @escaping (Result<T, ErgastAPIError>) -> Void) {
        
        URLSession.shared.fetch(.constructors,
                                for: season) { result in
            completion(result)
        }
    }
}

