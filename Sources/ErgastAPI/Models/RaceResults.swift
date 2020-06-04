//
//  RaceResults.swift
//  
//
//  Created by Giovanni Noa on 5/11/20.
//

import Foundation

public struct RaceResults: Codable {
    let data: RaceResultsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct RaceResultsData: Codable {
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

struct RaceResult: Codable {
    let number: String
    let position: String
    let positionText: String
    let points: String
    let driver: Driver
    let constructor: Constructor
    let grid, laps, status: String
    let time: ResultTime?
    let fastestLap: FastestLap

    enum CodingKeys: String, CodingKey {
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

struct Driver: Codable {
    let driverID: String
    let permanentNumber: String
    let code: String
    let url: String
    let givenName: String
    let familyName: String
    let dateOfBirth: String
    let nationality: String

    enum CodingKeys: String, CodingKey {
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

struct FastestLap: Codable {
    let rank: String
    let lap: String
    let time: FastestLapTime
    let averageSpeed: AverageSpeed

    enum CodingKeys: String, CodingKey {
        case rank
        case lap
        case time = "Time"
        case averageSpeed = "AverageSpeed"
    }
}

struct AverageSpeed: Codable {
    let units: Units
    let speed: String
}

enum Units: String, Codable {
    case kph = "kph"
}

struct FastestLapTime: Codable {
    let time: String
}

struct ResultTime: Codable {
    let millis: String
    let time: String
}
