//
//  Endpoint.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

// MARK: - Endpoint
struct Endpoint {
    private var path = "/api/f1"
    
    init(with path: Path, for season: Season) {
        self.path.append(path.subPath(for: season))
    }
}

// MARK: - Endpoint URL Builder
extension Endpoint {
    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ergast.com"
        components.path = path
        
        guard let validURL = components.url else { fatalError() }
        
        return validURL
    }
}

