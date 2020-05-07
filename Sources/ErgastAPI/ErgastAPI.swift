import Foundation
import CloudKit

public struct ErgastAPI {
    public static func circuits(for season: Season, completion: @escaping (Result<YearCircuits, ErgastAPIError>) -> Void) {
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
    
    public static func allCircuits(completion: @escaping (Result<AllCircuits, ErgastAPIError>) -> Void) {
        ErgastAPIService.fetch(.circuits,
                               for: nil,
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
}

