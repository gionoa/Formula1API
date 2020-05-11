//
//  Path.swift
//
//
//  Created by Giovanni Noa on 4/29/20.
//

// MARK: - Path
/// Enum containing the sub-path for specifying an endpoint within the Ergast API.
enum Path {
    private static let basePath = "/api/f1" 
    
    /// Circuits (all, specific season)
    case circuits
    
    /// Constructors(all, specific season)
    case constructors
    
    /// Constructor Standings (all, specific season)
    case constructorStandings
    
    /// Drivers (all, specific season).
    case drivers
    
    /// Driver Standings.
    case driverStandings
    
    /// Race Schedule.
    case raceSchedule
    
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
    private func subPath(for season: SeasonYear? = nil) -> String {
        switch self {
        case .circuits:
            return "\(season?.query ?? "")/circuits.json"
        case .constructors:
            return "\(season?.query ?? "")/constructors.json"
        case .constructorStandings:
            return "\(season?.query ?? "")/constructorStandings.json"
        case .drivers:
            return "\(season?.query ?? "")/driverStandings.json"
        case .driverStandings:
            return "/driverStandings.json"
        case .raceSchedule:
            guard let year = season?.query else { fatalError("Season must be provided") }
            
            return "\(year).json"
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
    func urlPath(for season: SeasonYear?) -> String {
        return Path.basePath + subPath(for: season)
    }
    
    var decodingType: Decodable.Type {
        switch self {
        case .circuits: return Circuits.self
        case .constructors: return Constructors.self
        case .seasons: return Seasons.self
        case .raceSchedule: return RaceSchedule.self
        default: return Circuits.self
        }
    }
}
