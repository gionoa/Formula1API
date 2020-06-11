//
//  File.swift
//  
//
//  Created by Giovanni Noa on 6/10/20.
//

import Foundation

public struct PitStops: Codable {
    let data: PitStopsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct PitStopsData: Codable {
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

struct PitStop: Codable {
    let driverID, lap, stop, time: String
    let duration: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case lap, stop, time, duration
    }
}
