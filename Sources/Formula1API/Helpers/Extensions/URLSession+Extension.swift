//
//  URLSession+Extension.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

// MARK: - URLSession
extension URLSession {
    /// Callback-based networking data task. Called by the internal fetch function.
    /// - Parameters:
    ///   - url: URL to reach.
    ///   - session: URLSession instance.
    ///   - completion: Asynchronous closure to inject functionality once the network interaction completes.
    private func dataTask(_ url: URL,
                          _ session: URLSession,
                          completion: @escaping ((Result<Data, APIError>) -> Void)) {
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
    internal func fetch<T: Decodable>(_ subPath: Path,
                                      for season: Season? = nil,
                                      round: String? = nil,
                                      lap: String? = nil,
                                      limit: String? = nil,
                                      offset: String? = nil,
                                      session: URLSession = URLSession.shared,
                                      completion: @escaping ((Result<T, APIError>) -> Void)) {
        
        let endpoint = Endpoint(with: subPath,
                                for: season,
                                round: round,
                                lap: lap,
                                limit: limit,
                                offset: offset)
        let url = endpoint.url
        
        session.dataTask(url, session) { result in
            switch result {
            case .success(let data):
                do {
                    let decode = try subPath.decodingType.decode(from: data)
                    
                    completion(.success(decode as! T))
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
