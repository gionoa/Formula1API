//
//  Season.swift
//
//
//  Created by Giovanni Noa on 5/4/20.
//

import Foundation

// MARK: - Season
/// Season enum to indicate whether a networking function is to fetch all historical data, or data for a single season.
public enum Season {
    /// All seasons throughout F1 history.
    case all
    
    /// A speific year
    case year(Int)
}

extension Season {
    /// Function to be used by the Path endpoint builder.
    /// - Returns: String that will be part of the resultant URL.
    func query() -> String {
        switch self {
            case .all:
            return ""
            case .year(let year):
            return "/\(year)"
        }
    }
}
