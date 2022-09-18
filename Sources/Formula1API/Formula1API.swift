//
//  Formula1API.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

/// Public interface of functions for fetching Formula 1 data from the Ergast REST API.
public enum Formula1API {
    /// Fetches Formula 1 Circuits for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func circuits(for season: Season,
                                limit: String? = nil,
                                offset: String? = nil,
                                completion: @escaping (Result<Circuits, APIError>) -> Void) {
        
        URLSession.shared.fetch(.circuits,
                               for: season,
                               limit: limit,
                               offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Circuits for all seasons throughout history.
    /// - Parameters:
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func allCircuits(limit: String? = nil,
                                   offset: String? = nil,
                                   completion: @escaping (Result<Circuits, APIError>) -> Void) {
        
        URLSession.shared.fetch(.circuits,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Drivers - either all, or for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func drivers(for season: Season,
                               limit: String? = nil,
                               offset: String? = nil,
                               completion: @escaping (Result<Drivers, APIError>) -> Void) {
        
        URLSession.shared.fetch(.drivers,
                                for: season,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Seasons throughout history.
    /// - Parameters:
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func seasons(limit: String? = nil,
                               offset: String? = nil,
                               completion: @escaping (Result<Seasons, APIError>) -> Void) {
        
        URLSession.shared.fetch(.seasons,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Constructors for all seasons throughout history.
    /// - Parameters:
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func allConstructors(limit: String? = nil,
                                       offset: String? = nil,
                                       completion: @escaping (Result<Constructors, APIError>) -> Void) {
        
        URLSession.shared.fetch(.constructors,
                                limit: limit,
                                offset: limit) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Constructors for a given season.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func constructors(for season: Season,
                                    limit: String? = nil,
                                    offset: String? = nil,
                                    completion: @escaping (Result<Constructors, APIError>) -> Void) {
        
        URLSession.shared.fetch(.constructors,
                                for: season,
                                limit: limit,
                                offset: limit) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Driver standings for a given season.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit:  Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func driverStandings(for season: Season,
                                       limit: String? = nil,
                                       offset: String? = nil,
                                       completion: @escaping (Result<DriverStandings, APIError>) -> Void) {
        
        URLSession.shared.fetch(.driverStandings,
                                for: season,
                                limit: limit,
                                offset: limit) { result in
            completion(result)
        }
    }
                                       
    
    /// Fetches Formula 1 Race Schedule for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func raceSchedule(for season: Season,
                                    limit: String? = nil,
                                    offset: String? = nil,
                                    completion: @escaping (Result<RaceSchedule, APIError>) -> Void) {

        URLSession.shared.fetch(.raceSchedule,
                                for: season,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Formula 1 Race Results for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func raceResults(for season: Season,
                                   limit: String? = nil,
                                   offset: String? = nil,
                                   completion: @escaping(Result<RaceResults, APIError>) -> Void) {
        
        URLSession.shared.fetch(.raceResults,
                                for: season,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Qualifying Results for a given year.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func qualifyingResults(for season: Season,
                                         limit: String? = nil,
                                         offset: String? = nil,
                                         completion: @escaping (Result<QualifyingResults, APIError>) -> Void) {
        
        URLSession.shared.fetch(.qualifyingResults,
                                for: season,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches Pit Stops for a given year and round.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - round: A race within the season.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func pitStops(for season: Season,
                                round: String,
                                limit: String? = nil,
                                offset: String? = nil,
                                completion: @escaping (Result<PitStops, APIError>) -> Void) {
        
        URLSession.shared.fetch(.pitStops,
                                for: season,
                                round: round,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches lap times for a lap within a race.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - round: A race within the season.
    ///   - lap: Lap of given race.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func laps(for season: Season,
                            round: String,
                            lap: String? = nil,
                            limit: String? = nil,
                            offset: String? = nil,
                            completion: @escaping (Result<Laps, APIError>) -> Void) {
        
        URLSession.shared.fetch(.lapTimes(lap),
                                for: season,
                                round: round,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
    
    /// Fetches finishing status for given season.
    /// - Parameters:
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).
    ///   - round: A race within the season.
    ///   - limit: Property to specify number of items to return per request.
    ///   - offset: Property to indicate starting point of elements from API request.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    public static func finishingStatus(for season: Season,
                                       round: String? = nil,
                                       limit: String? = nil,
                                       offset: String? = nil,
                                       completion: @escaping (Result<FinishingStatus, APIError>) -> Void) {
        
        URLSession.shared.fetch(.finishingStatus,
                                for: season,
                                limit: limit,
                                offset: offset) { result in
            completion(result)
        }
    }
}
