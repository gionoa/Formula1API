//
//  Lap.swift
//  
//
//  Created by Giovanni Noa on 6/11/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the Lap endpoint.
public struct Laps: Codable {
    let data: LapsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct LapsData: Codable {
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

struct LapElement: Codable {
    let number: String
    let timings: [Timing]

    enum CodingKeys: String, CodingKey {
        case number
        case timings = "Timings"
    }
}

struct Timing: Codable {
    let driverID: String
    let position: String
    let time: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case position
        case time
    }
}
