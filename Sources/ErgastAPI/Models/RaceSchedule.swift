//
//  RaceSchedule.swift
//  
//
//  Created by Giovanni Noa on 5/10/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the RaceSchedule endpoint.
public struct RaceSchedule: Codable {
    let data: RaceScheduleData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct RaceScheduleData: Codable {
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let raceTable: RaceTable

    enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case raceTable = "RaceTable"
    }
}

struct RaceTable: Codable {
    let season: String
    let round: String?
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season
        case round
        case races = "Races"
    }
}

struct Race: Codable {
    let season: String
    let round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date: String
    let time: String
    let qualifyingResults: [QualifyingResult]?
    let pitStops: [PitStop]?

    enum CodingKeys: String, CodingKey {
        case season
        case round
        case url
        case raceName
        case circuit = "Circuit"
        case date
        case time
        case qualifyingResults = "QualifyingResults"
        case pitStops
    }
}
