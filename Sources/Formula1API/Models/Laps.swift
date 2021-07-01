//
//  Lap.swift
//  
//
//  Created by Giovanni Noa on 6/11/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the Laps endpoint.
public struct Laps: Codable {
    public let data: LapsData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct LapsData: Codable {
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

public struct LapElement: Codable {
    public let number: String
    public let timings: [Timing]

    private enum CodingKeys: String, CodingKey {
        case number
        case timings = "Timings"
    }
}

public struct Timing: Codable {
    public let driverID: String
    public let position: String
    public let time: String

    private enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case position
        case time
    }
}
