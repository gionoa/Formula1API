//
//  Endpoint.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

/// Indicates URL components for the Ergast REST API.
enum ErgastEndpoint {
    /// URL scheme.
    static let scheme = "https"
    
    /// URL host.
    static let host = "ergast.com"
}

/// Generates a URL for a given Path enum case.
struct Endpoint {
    private let urlPath: String
    
    /// Initializer for an Endpoint object.
    /// - Parameters:
    ///   - path: Specify a path, mapping to a specific endpoint of the Ergast REST API.
    ///   - season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).  All historical seasons will be fetched if nil. 
    init(with path: Path, for season: Season? = nil) {
        urlPath = path.urlPath(for: season)
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
        
        guard let validURL = components.url else { fatalError("Could not construct URL.") }
        
        return validURL
    }
}

