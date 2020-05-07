//
//  AllCircuits.swift
//
//
//  Created by Giovanni Noa on 5/5/20.
//

import Foundation

public struct AllCircuits: Codable {
    let data: AllCircuitData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

#warning("Remove unnecessary objects")
struct AllCircuitData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let circuitTable: AllCircuitTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
        case circuitTable = "CircuitTable"
    }
}

struct AllCircuitTable: Codable {
    let circuits: [Circuit]

    enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
    }
}

public struct Circuit: Codable {
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

struct Location: Codable {
    let lat, long, locality, country: String
}


