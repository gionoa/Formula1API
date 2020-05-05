//
//  File.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation
import Combine
import UIKit

// MARK: - Web Service
enum ErgastAPIService { }

extension ErgastAPIService
{
    // MARK: - Static functions
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
    
    static func fetch<T>(_ subPath: Path,
                                    for season: Season,
                                    session: URLSession = URLSession.shared,
                                    decodingType: T.Type,
                                    _ completion: @escaping ((Result<T, ErgastAPIError>) -> Void)) where T: Decodable {
        
        let endpoint = Endpoint(with: subPath, for: season)
        let url = endpoint.url
        
        ErgastAPIService.dataTask(url, session) { result in
            switch result {
            case .success(let data) :
                do {
                    let decode = try JSONDecoder().decode(T.self, from: data)
                    
                    completion(.success(decode))
                } catch (let error) {
                    print(error)
                    completion(.failure(.network(error.localizedDescription)))
                }
                
            case .failure(let error):
                print(error)
                fatalError()
            }
        }
    }
}
