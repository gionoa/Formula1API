//
//  DriverInfo.swift
//
//
//  Created by Giovanni Noa on 6/12/20.
//

import Foundation

public struct Drivers: Codable {
    let data: DriversData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct DriversData: Codable {
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let driverTable: DriverTable

    enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case driverTable = "DriverTable"
    }
}

struct DriverTable: Codable {
    let season: String
    let drivers: [Driver]

    enum CodingKeys: String, CodingKey {
        case season
        case drivers = "Drivers"
    }
}
