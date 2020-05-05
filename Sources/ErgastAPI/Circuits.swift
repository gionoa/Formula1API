//
//  File.swift
//  
//
//  Created by Giovanni Noa on 4/29/20.
//

import Foundation

// MARK: - Circuits
public struct CircuitsResult: Codable {
    let circuits: [Circuit]
}

public struct Circuit: Codable {
    let circuitID: Int
    let circuitRef, name, location, country: String
    let lat, lng: Double
   
    enum CodingKeys: String, CodingKey {
        case circuitID = "circuitId"
        case circuitRef, name, location, country, lat, lng
    }
}
