//
//  Path.swift
//
//
//  Created by Giovanni Noa on 4/29/20.
//

// MARK: - Path
/// Enum containing the sub-path for specifying an endpoint within the Ergast API.
enum Path {
    private var basePath: String { "/api/f1" }

    /// Circuits (all, specific season)
    case circuits
    
    /// Constructor Standings (all, specific season)
    case constructorStandings
    
    /// Drivers (all, specific season).
    case drivers
    
    /// Driver Standings.
    case driverStandings
    
    /// Race Results.
    case results
    
    /// Race Standings (all, specific season).
    case raceStandings
    
    /// Seasons throughout history.
    case seasons
}

extension Path {
    /// Function that generates the path for an endpoint within the Ergast API.
    /// - Parameter season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).  Data for historical seasons will be fetched if nil.
    /// - Returns: String to be added to the Endpoint path.
    private func subPath(for season: Season? = nil) -> String {
        switch self {
        case .circuits:
            return "\(season?.query ?? "")/circuits.json"
        case .constructorStandings:
            return "\(season?.query ?? "")/constructorStandings.json"
        case .drivers:
            return "\(season?.query ?? "")/driverStandings.json"
        case .driverStandings:
            return "/driverStandings.json"
        case .results:
            return "/results.json"
        case .raceStandings:
            return "\(season?.query ?? "")/results.json"
        case .seasons:
            return "/seasons.json"
        }
    }
    
    /// Constructs a path.
    /// - Parameter season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). All historical seasons will be fetched if nil.
    /// - Returns: String representing a URL path.
    func urlPath(for season: Season?) -> String {
            return basePath + subPath(for: season)
    }
}
