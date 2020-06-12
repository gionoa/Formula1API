//
//  Endpoint.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation


/// Internal struct for query items used in Ergast URLs.
private enum ErgastQueryItems {
    /// Limit indicator, to specify to the API how many items to return at a time per request.
    case limit(String?)
    
    /// Offset indicator, to specify to the API the starting point of elements.
    case offset(String?)
}

/// Indicates URL components for the Ergast REST API.
private enum ErgastEndpoint {
    /// URL scheme.
    static let scheme = "https"
    
    /// URL host.
    static let host = "ergast.com"
}

/// Generates a URL for a given Path enum case.
internal struct Endpoint {
    /// URL for Ergast API.
    private let urlPath: String
    
    /// Indicates number of items to return per request.
    private var limit: String?
    
    /// Indicates the starting point of elements from API request.
    private var offset: String?
    
    /// Initializer for an Endpoint object.
    /// - Parameters:
    ///   - path: Specify a path, mapping to a specific endpoint of the Ergast REST API.
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).  All historical seasons will be fetched if nil.
    ///   - limit: Optional property to specify number of items to return per request.
    ///   - offset: Optional property to indicate starting point of elements from API request.
    init(with path: Path,
         for season: Season?,
         round: String?,
         lap: String?,
         limit: String?,
         offset: String?) {
        
        urlPath = path.urlPath(for: season, round: round, lap: lap)
        
        self.limit = limit
        self.offset = offset
    }
}

// MARK: - Endpoint URL Builder
extension Endpoint {
    /// URL for the given path.
    var url: URL {
        var components = URLComponents()
        components.scheme = ErgastEndpoint.scheme
        components.host = ErgastEndpoint.host
        components.path = urlPath
        
        if let limit = limit,
           let offset = offset {
            components.queryItems = [URLQueryItem(name: "limit", value: limit),
                                     URLQueryItem(name: "offset", value: offset)]
        }
        
        guard let validURL = components.url else { fatalError("Could not construct URL.") }
        
        return validURL
    }
}
