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
    /// A year, representing a specific season (1950-2020).
    case year(Int)
}

extension Season {
    /// Function to be used by the Path endpoint builder.
    /// - Returns: String that will be part of the resultant URL.
    var query: String? {
        switch self {
            case .year(let year):
            return "/\(year)"
        }
    }
}
