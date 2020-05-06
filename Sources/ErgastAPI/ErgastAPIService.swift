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
                                 _ completion: @escaping ((Result<Data, ErgastAPIError>) -> Void))
    {
        session.dataTask(with: url) { data, response, error in
            #warning("Handle the rest of networking")
            guard let data = data, error == nil else {
                completion(.failure(.network(error!.localizedDescription)))
                return
            }
            
            completion(.success(data))
        }
        .resume()
    }
    
    
    /// Callback-based networking fetch function. Calls the data task function and decodes the JSON response.
    /// - Parameters:
    ///   - subPath: Path enum case to indicate which endpoint you wish to fetch from.
    ///   - season: Season enum case to indicate whether you wish to fetch all historical data, or for a specific year.
    ///   - session: URLSession instance (URLSession.shared singleton by default)
    ///   - decodingType: Decodable-conforming object to be used for serializing JSON response.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction finishes fetching.
    internal static func fetch<T>(_ subPath: Path,
                                    for season: Season?,
                                    session: URLSession = URLSession.shared,
                                    decodingType: T.Type,
                                    _ completion: @escaping ((Result<T, ErgastAPIError>) -> Void)) where T: Decodable {
        
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
            }
        }
    }
}

