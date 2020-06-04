//
//  Constructors.swift
//  
//
//  Created by Giovanni Noa on 5/9/20.
//

import Foundation

public struct Constructors: Codable {
    let data: ConstructorsData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct ConstructorsData: Codable {
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let constructorTable: ConstructorTable

    enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case constructorTable = "ConstructorTable"
    }
}

struct ConstructorTable: Codable {
    let season: String
    let constructors: [Constructor]

    enum CodingKeys: String, CodingKey {
        case season
        case constructors = "Constructors"
    }
}

struct Constructor: Codable {
    let constructorID: String
    let url: String
    let name: String
    let nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url
        case name
        case nationality
    }
}
