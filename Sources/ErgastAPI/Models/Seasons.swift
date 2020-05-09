//
//  Seasons.swift
//
//
//  Created by Giovanni Noa on 5/7/20.
//

/// Codable struct, used for serializing JSON from the Seasons endpoint.
public struct Seasons: Codable {
    let data: SeasonData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct SeasonData: Codable {
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let seasonTable: SeasonTable

    enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case seasonTable = "SeasonTable"
    }
}

struct SeasonTable: Codable {
    let seasons: [Season]

    enum CodingKeys: String, CodingKey {
        case seasons = "Seasons"
    }
}

struct Season: Codable {
    let season: String
    let url: String
}
