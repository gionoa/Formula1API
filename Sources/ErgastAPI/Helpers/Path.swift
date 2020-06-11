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
    
    /// Pit Stops.
    case pitStops
    
    /// Race Schedule.
    case raceSchedule
    
    /// Race Results.
    case raceResults
    
    /// Race Standings (all, specific season).
    case raceStandings
    
    /// Seasons throughout history.
    case seasons
    
    /// Qualifying Results for a given year.
    case qualifyingResults
}

extension Path {
    /// Function that generates the path for an endpoint within the Ergast API.
    /// - Parameter season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020).  Data for historical seasons will be fetched if nil.
    /// - Returns: String to be added to the Endpoint path.
    private func subPath(for season: SeasonYear? = nil, andRound round: String? = nil) -> String {
        let year = season?.query ?? ""
        let race = round ?? ""
        
        switch self {
        case .circuits:
            return "\(year)/circuits.json"
        case .constructors:
            return "\(year)/constructors.json"
        case .constructorStandings:
            return "\(year)/constructorStandings.json"
        case .drivers:
            return "\(year)/drivers.json"
        case .driverStandings:
            return "\(year)/driverStandings.json"
        case .pitStops:
            return "\(year)/\(race)/pitstops.json"
        case .raceSchedule:
            return "\(year).json"
        case .raceResults:
            return "\(year)/results.json"
        case .raceStandings:
            return "\(year)/results.json"
        case .seasons:
            return "/seasons.json"
        case .qualifyingResults:
            return "\(year)/qualifying.json"
        }
    }
    
    /// Constructs a path.
    /// - Parameter season: Season enum case, specified by an Int, which indicates to fetch data for a given year (1950-2020). All historical seasons will be fetched if nil.
    /// - Returns: String representing a URL path.
    func urlPath(for season: SeasonYear?,
                 round: String?) -> String {
        return Path.basePath + subPath(for: season,
                                       andRound: round)
    }
    
    /// Returns a Decodable type for a given endpoint.
    var decodingType: Decodable.Type {
        switch self {
        case .circuits: return Circuits.self
        case .constructors: return Constructors.self
        case .seasons: return Seasons.self
        case .pitStops: return PitStops.self
        case .raceResults: return RaceResults.self
        case .raceSchedule: return RaceSchedule.self
        case .qualifyingResults: return QualifyingResults.self
        default: fatalError("Must provide Decodable type for enum case")
        }
    }
}
