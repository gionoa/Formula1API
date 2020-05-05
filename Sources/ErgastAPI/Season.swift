//
//  File 2.swift
//  
//
//  Created by Giovanni Noa on 5/4/20.
//

import Foundation

// MARK: - Season
public enum Season {
    case all
    case year(Int)
    
    func query() -> String {
        switch self {
            case .all:
            return ""
            case .year(let year):
            return "/\(year)"
        }
    }
}
