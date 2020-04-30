////
////  File.swift
////  
////
////  Created by Giovanni Noa on 4/28/20.
////
//
//import Foundation
//import Combine
//
//#if canImport(UIKit)
//extension ErgastAPI {
//    enum WebService { }
//
//   
//}
//
//// MARK: - Web Service
//extension WebService {
//       // MARK: - Static functions
//       private static func dataTask(_ url: URL) -> AnyPublisher<Data, Error> {
//           return
//               URLSession.shared
//                   .dataTaskPublisher(for: url)
//                   .tryMap { data, response in
//                       guard
//                           let httpResponse = response as? HTTPURLResponse,
//                           200..<300 ~= httpResponse.statusCode
//                           else {
//                               print(response.description)
//                               throw PublisherError.network
//                       }
//                       return data
//                   }
//                   .eraseToAnyPublisher()
//       }
//       
//       static func fetch<T: Decodable>(_ subPath: Path, for year: Int? = 2019) -> AnyPublisher<T, PublisherError> {
//           let url = Endpoint(subPath, for: year).url!
//           return
//               dataTask(url)
//                   .decode(type: T.self, decoder: JSONDecoder())
//                   .mapError { error in
//                       print(error)
//                       return PublisherError.parsing }
//                   .eraseToAnyPublisher()
//       }
//       
//       static func fetchImage(urlString: String) -> AnyPublisher<UIImage, Error> {
//           let url = URL(string: urlString)
//           return
//               URLSession.shared.dataTaskPublisher(for: url!)
//                   .tryMap { data, response in
//                       guard let image = UIImage(data: data) else {
//                           throw PublisherError.parsing
//                       }
//                       return image
//                   }
//                   .receive(on: RunLoop.main)
//                   .eraseToAnyPublisher()
//          }
//   }
//
//#endif
