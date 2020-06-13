//
//  DriverStandings.swift
//  
//
//  Created by Giovanni Noa on 6/12/20.
//

import Foundation

public struct DriverStandings: Codable {
    let data: DriverStandingsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

// MARK: - MRData
struct DriverStandingsData: Codable {
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let standingsTable: StandingsTable

    enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case standingsTable = "StandingsTable"
    }
}

struct StandingsTable: Codable {
    let season: String
    let standingsLists: [StandingsList]

    enum CodingKeys: String, CodingKey {
        case season
        case standingsLists = "StandingsLists"
    }
}

struct StandingsList: Codable {
    let season, round: String
    let driverStandings: [DriverStanding]

    enum CodingKeys: String, CodingKey {
        case season, round
        case driverStandings = "DriverStandings"
    }
}

struct DriverStanding: Codable {
    let position: String
    let positionText: String
    let points: String
    let wins: String
    let driver: Driver
    let constructors: [Constructor]

    enum CodingKeys: String, CodingKey {
        case position
        case positionText
        case points
        case wins
        case driver = "Driver"
        case constructors = "Constructors"
    }
}
