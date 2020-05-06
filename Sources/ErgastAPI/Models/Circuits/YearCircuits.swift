//
//  YearCircuits.swift
//
//
//  Created by Giovanni Noa on 5/5/20.
//

import Foundation

public struct YearCircuits: Codable {
    let data: YearCircuitData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct YearCircuitData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let circuitTable: YearCircuitTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case circuitTable = "CircuitTable"
    }
}

struct YearCircuitTable: Codable {
    let season: String
    let circuits: [YearCircuit]

    enum CodingKeys: String, CodingKey {
        case season
        case circuits = "Circuits"
    }
}

public struct YearCircuit: Codable {
    let circuitID: String
    let url: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case url, circuitName
        case location = "Location"
    }
}


