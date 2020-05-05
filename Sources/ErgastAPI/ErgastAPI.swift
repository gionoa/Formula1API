import Foundation
import CloudKit

public struct ErgastAPI {
//    static let shared = ErgastAPI()
//    
//    let containerIdentifier = "iCloud.ErgastAPI"
   // let secondContainer = CKContainer(identifier: containerIdentifier)
    
    public static func circuits(for season: Season, _ completion: @escaping (Result<[Circuit], ErgastAPIError>) -> Void) {
        ErgastAPIService.fetch(.circuits, for: .all, decodingType: CircuitsResult.self) { result in
            switch result {
            case .success(let response):
                print(response.circuits)
                completion(.success(response.circuits))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
