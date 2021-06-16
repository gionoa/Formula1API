//
//  Circuits.swift
//
//
//  Created by Giovanni Noa on 5/5/20.
//

/// Codable struct, used for serializing JSON from the Circuits endpoint.
public struct Circuits: Codable {
    let data: CircuitData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct CircuitData: Codable {
    let url: String
    let limit: String
    let offset: String
    let total: String
    let circuitTable: CircuitTable

    enum CodingKeys: String, CodingKey {
        case url
        case limit
        case offset
        case total
        case circuitTable = "CircuitTable"
    }
}

struct CircuitTable: Codable {
    let circuits: [Circuit]

    enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
    }
}

public struct Circuit: Codable {
    let circuitID: String
    let circuitName: String
    let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case circuitName
        case location = "Location"
    }
}

struct Location: Codable {
    let lat: String
    let long: String
    let locality: String
    let country: String
}
