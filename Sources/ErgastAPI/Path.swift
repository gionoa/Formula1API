//
//  File.swift
//  
//
//  Created by Giovanni Noa on 4/29/20.
//

import Foundation

// MARK: - Path
enum Path {
    case circuits
    case constructorStandings
    case drivers
    case driverStandings
    case results
    case raceStandings
    case seasons
     
    func subPath(for season: Season) -> String {
        switch self {
        case .circuits:
            return "\(season.query())/circuits.json"
        case .constructorStandings:
            return "\(season.query())/constructorStandings.json"
        case .drivers:
            return "\(season.query())/driverStandings.json"
        case .driverStandings:
            return "/driverStandings.json"
        case .results:
            return "/results.json"
        case .raceStandings:
            return "\(season.query())/results.json"
        case .seasons:
            return "/seasons.json"
        }
    }
}
