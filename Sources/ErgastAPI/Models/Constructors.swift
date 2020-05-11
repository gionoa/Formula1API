//
//  Constructors.swift
//  
//
//  Created by Giovanni Noa on 5/9/20.
//

import Foundation

public struct Constructors: Codable {
    let mrData: ConstructorsData

    enum CodingKeys: String, CodingKey {
        case mrData = "MRData"
    }
}

struct ConstructorsData: Codable {
    let xmlns: String
    let series: String
    let url: String
    let limit, offset, total: String
    let constructorTable: ConstructorTable

    enum CodingKeys: String, CodingKey {
        case xmlns, series, url, limit, offset, total
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
    let name, nationality: String

    enum CodingKeys: String, CodingKey {
        case constructorID = "constructorId"
        case url, name, nationality
    }
}
