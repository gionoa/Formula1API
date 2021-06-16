//
//  Circuits.swift
//
//
//  Created by Giovanni Noa on 5/5/20.
//

/// Codable struct, used for serializing JSON from the Circuits endpoint.
public struct Circuits: Codable {
    public let data: CircuitData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

extension Circuits {
    public var circuits: [Circuit] { self.data.circuitTable.circuits }
}

struct CircuitData: Codable {
    public let url: String
    public let limit: String
    public let offset: String
    public let total: String
    public let circuitTable: CircuitTable

    enum CodingKeys: String, CodingKey {
        case url
        case limit
        case offset
        case total
        case circuitTable = "CircuitTable"
    }
}

struct CircuitTable: Codable {
    public let circuits: [Circuit]

    enum CodingKeys: String, CodingKey {
        case circuits = "Circuits"
    }
}

public struct Circuit: Codable {
    let circuitID: String
    public let circuitName: String
    public let location: Location

    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case circuitName
        case location = "Location"
    }
}

public struct Location: Codable {
    public let lat: String
    public let long: String
    public let locality: String
    public let country: String
}
