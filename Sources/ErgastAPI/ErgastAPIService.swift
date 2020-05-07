//
//  ErgastAPIService.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation
import UIKit

// MARK: - Ergast API Service
/// Ergast service for interacting with the Ergast endpoints within the ErgastAPI package.
enum ErgastAPIService {
    // MARK: - Static Networking Functions
    /// Callback-based networking data task. Called by the internal fetch function.
    /// - Parameters:
    ///   - url: URL to reach.
    ///   - session: URLSession instance.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    private static func dataTask(_ url: URL,
                                 _ session: URLSession,
                                 completion: @escaping ((Result<Data, ErgastAPIError>) -> Void))
    {
        session.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                if let error = error {
                    completion(.failure(.network(error.localizedDescription)))
                } else {
                    completion(.failure(.data("Failed to generate data.")))
                }
                return
            }
            completion(.success(data))
        }
        .resume()
    }
    
    /// Callback-based networking fetch function. Calls the data task function and decodes the JSON response.
    /// - Parameters:
    ///   - subPath: Path enum case to indicate which endpoint you wish to fetch from.
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). Fetches data for all historical seasons of given endpoint if nil.
    ///   - session: URLSession instance (URLSession.shared singleton by default)
    ///   - decodingType: Decodable-conforming object to be used for serializing JSON response.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction finishes fetching.
    internal static func fetch<T: Decodable>(_ subPath: Path,
                                    for season: Season? = nil,
                                    decodingType: T.Type,
                                    session: URLSession = URLSession.shared,
                                    completion: @escaping ((Result<T, ErgastAPIError>) -> Void)) {
        
        let endpoint = Endpoint(with: subPath, for: season)
        let url = endpoint.url
        
        ErgastAPIService.dataTask(url, session) { result in
            switch result {
            case .success(let data):
                do {
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(.success(decode))
                } catch (let error) {
                    print(error)
                    completion(.failure(.network(error.localizedDescription)))
                }
                
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}

