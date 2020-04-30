//
//  File.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

// MARK: - Path
enum Path: String {
    case circuits = "/current/circuits.json"
    case constructorStandings = "/current/constructorStandings.json"
    case drivers = "/current/driverStandings.json"
    case driverStandings = "/driverStandings.json"
    case results = "/results"
    case raceStandings = "/current/results.json"
    case seasons = "/seasons.json"
     
    func path(for year: Int = 2019) -> String {
        switch self {
        case .circuits:
            return "/\(year)/circuits.json"
        case .constructorStandings:
            return "/\(year)/constructorStandings.json"
        case .drivers:
            return "/\(year)/driverStandings.json"
        case .driverStandings:
            return "/driverStandings.json"
        case .results:
            return "/results.json"
        case .raceStandings:
            return "/\(year)/results.json"
        case .seasons:
            return "/seasons.json"
        }
    }
}

// MARK: - Endpoint
struct Endpoint {
    private (set) var path = "/api/f1"
    
    init(_ subPath: Path, for year: Int? = 2019) {
        path.append(subPath.path(for: year ?? 2019))
    }
}

// MARK: - Path url
extension Endpoint {
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "ergast.com"
        components.path = path
        return components.url
    }
}
