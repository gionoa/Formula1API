//
//  RaceSchedule.swift
//  
//
//  Created by Giovanni Noa on 5/10/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the RaceSchedule endpoint.
public struct RaceSchedule: Codable {
    public let data: RaceScheduleData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct RaceScheduleData: Codable {
    public let series: String
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let raceTable: RaceTable

    private enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case raceTable = "RaceTable"
    }
}

public struct RaceTable: Codable {
    public let season: String
    public let round: String?
    public let races: [Race]

    private enum CodingKeys: String, CodingKey {
        case season
        case round
        case races = "Races"
    }
}

public struct Race: Codable {
    public let season: String
    public let round: String
    public let url: String
    public let raceName: String
    public let circuit: Circuit
    public let date: String
    public let time: String
    public let qualifyingResults: [QualifyingResult]?
    public let pitStops: [PitStop]?
    public let laps: [LapElement]?


    private enum CodingKeys: String, CodingKey {
        case season
        case round
        case url
        case raceName
        case circuit = "Circuit"
        case date
        case time
        case qualifyingResults = "QualifyingResults"
        case pitStops = "PitStops"
        case laps = "Laps"
    }
}
