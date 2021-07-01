//
//  RaceResults.swift
//  
//
//  Created by Giovanni Noa on 5/11/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the RaceResults endpoint.
public struct RaceResults: Codable {
    public let data: RaceResultsData

    private enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

public struct RaceResultsData: Codable {
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

public struct RaceResult: Codable {
    public let number: String
    public let position: String
    public let positionText: String
    public let points: String
    public let driver: Driver
    public let constructor: Constructor
    public let grid, laps, status: String
    public let time: ResultTime?
    public let fastestLap: FastestLap

    private enum CodingKeys: String, CodingKey {
        case number
        case position
        case positionText
        case points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

public struct Driver: Codable {
    public let driverID: String
    public let permanentNumber: String?
    public let code: String?
    public let url: String
    public let givenName: String
    public let familyName: String
    public let dateOfBirth: String
    public let nationality: String

    private enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber
        case code
        case url
        case givenName
        case familyName
        case dateOfBirth
        case nationality
    }
}

public struct FastestLap: Codable {
    public let rank: String
    public let lap: String
    public let time: FastestLapTime
    public let averageSpeed: AverageSpeed

    private enum CodingKeys: String, CodingKey {
        case rank
        case lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

public struct AverageSpeed: Codable {
    public let units: Units
    public let speed: String
}

public enum Units: String, Codable {
    case kph = "kph"
}

public struct FastestLapTime: Codable {
    public let time: String
}

public struct ResultTime: Codable {
    public let millis: String
    public let time: String
}
