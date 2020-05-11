//
//  RaceSchedule.swift
//  
//
//  Created by Giovanni Noa on 5/10/20.
//

import Foundation

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
    let races: [Race]

    enum CodingKeys: String, CodingKey {
        case season
        case races = "Races"
    }
}

struct Race: Codable {
    let season, round: String
    let url: String
    let raceName: String
    let circuit: Circuit
    let date, time: String

    enum CodingKeys: String, CodingKey {
        case season, round, url, raceName
        case circuit = "Circuit"
        case date, time
    }
}