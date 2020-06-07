//
//  Endpoint.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

private enum ErgastQueryItems {
    case limit(String?)
    
    case offset(String?)
}

/// Indicates URL components for the Ergast REST API.
internal enum ErgastEndpoint {
    /// URL scheme.
    static let scheme = "https"
    
    /// URL host.
    static let host = "ergast.com"
}

/// Generates a URL for a given Path enum case.
struct Endpoint {
    private let urlPath: String
    
    private var limit: String?
    private var offset: String?
    
    /// Initializer for an Endpoint object.
    /// - Parameters:
    ///   - path: Specify a path, mapping to a specific endpoint of the Ergast REST API.
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).  All historical seasons will be fetched if nil. 
    init(with path: Path,
         for season: SeasonYear?,
         limit: String?,
         offset: String?) {
        
        urlPath = path.urlPath(for: season)
        
        if let limit = limit,
           let offset = offset {
            self.limit = limit
            self.offset = offset
        }
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
        components.queryItems = [URLQueryItem(name: "limit", value: self.limit),
                                 URLQueryItem(name: "offset", value: self.offset)]
        
        guard let validURL = components.url else { fatalError("Could not construct URL.") }
        
        return validURL
    }
}

