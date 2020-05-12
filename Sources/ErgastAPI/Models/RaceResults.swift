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
        case number, position, positionText, points
        case driver = "Driver"
        case constructor = "Constructor"
        case grid, laps, status
        case time = "Time"
        case fastestLap = "FastestLap"
    }
}

struct Driver: Codable {
    let driverID, permanentNumber, code: String
    let url: String
    let givenName, familyName, dateOfBirth, nationality: String

    enum CodingKeys: String, CodingKey {
        case driverID = "driverId"
        case permanentNumber, code, url, givenName, familyName, dateOfBirth, nationality
    }
}

struct FastestLap: Codable {
    let rank, lap: String
    let time: FastestLapTime
    let averageSpeed: AverageSpeed

    enum CodingKeys: String, CodingKey {
        case rank, lap
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
    let millis, time: String
}
