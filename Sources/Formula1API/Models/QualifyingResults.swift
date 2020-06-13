//
//  QualifyingResults.swift
//  
//
//  Created by Giovanni Noa on 6/3/20.
//

import Foundation

/// Codable struct, used for serializing JSON from the QualifyingResults endpoint.
public struct QualifyingResults: Codable {
    let data: QualifyingResultsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct QualifyingResultsData: Codable {
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

struct QualifyingResult: Codable {
    let number: String
    let position: String
    let driver: Driver
    let constructor: Constructor
    let q1: String
    let q2: String?
    let q3: String?

    enum CodingKeys: String, CodingKey {
        case number
        case position
        case driver = "Driver"
        case constructor = "Constructor"
        case q1 = "Q1"
        case q2 = "Q2"
        case q3 = "Q3"
    }
}
