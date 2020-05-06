import Foundation
import CloudKit

public struct ErgastAPI {
    public static func circuits(for season: Season, _ completion: @escaping (Result<YearCircuits, ErgastAPIError>) -> Void) {
        ErgastAPIService.fetch(.circuits,
                               for: season,
                               decodingType: YearCircuits.self) { result in
            switch result {
            case .success(let response):
                print(response)
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    public static func allCircuits(_ completion: @escaping (Result<AllCircuits, ErgastAPIError>) -> Void) {
        ErgastAPIService.fetch(.circuits,
                               for: .all,
                               decodingType: AllCircuits.self) { result in
            switch result {
            case .success(let response):
                print(response)
                completion(.success(response))
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
//
//    private static func parseResponse<T: Decodable, U: Error>(_ result: Result<T, U>) -> Result<T, U> {
//
//
//    }
}

