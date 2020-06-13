//
//  FinishingStatus.swift
//  
//
//  Created by Giovanni Noa on 6/12/20.
//

import Foundation

public struct FinishingStatus: Codable {
    let data: FinishingStatusData

    enum CodingKeys: String, CodingKey {
        case data = "MRData"
    }
}

struct FinishingStatusData: Codable {
    let series: String
    let url: String
    let limit: String
    let offset: String
    let total: String
    let statusTable: StatusTable

    enum CodingKeys: String, CodingKey {
        case series
        case url
        case limit
        case offset
        case total
        case statusTable = "StatusTable"
    }
}

struct StatusTable: Codable {
    let season: String
    let status: [Status]

    enum CodingKeys: String, CodingKey {
        case season
        case status = "Status"
    }
}

struct Status: Codable {
    let statusID: String
    let count: String
    let status: String

    enum CodingKeys: String, CodingKey {
        case statusID = "statusId"
        case count
        case status
    }
}
