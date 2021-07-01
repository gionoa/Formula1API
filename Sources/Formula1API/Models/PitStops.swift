//
//  PitStops.swift
//  
//
//  Created by Giovanni Noa on 6/10/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the PitStops endpoint.
public struct PitStops: Codable {
    public let data: PitStopsData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct PitStopsData: Codable {
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

public struct PitStop: Codable {
    public let driverID: String
    public let lap: String
    public let stop: String
    public let time: String
    public let duration: String

    private enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case lap
        case stop
        case time
        case duration
    }
}
