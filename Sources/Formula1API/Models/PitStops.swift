//
//  PitStops.swift
//  
//
//  Created by Giovanni Noa on 6/10/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the PitStops endpoint.
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
    let driverID: String
    let lap: String
    let stop: String
    let time: String
    let duration: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case lap
        case stop
        case time
        case duration
    }
}
