//
//  File.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

// MARK: - Publisher Error
enum PublisherError: Error {
    case url(String)
    case network(String)
    case parsing(String)
}

// MARK: - Publisher Description
extension PublisherError: CustomStringConvertible {
    var description: String {
        switch self {
            case .url: return "Failed to build URL"
            case .network: return "Failed to reach server"
            case .parsing: return "Failed to decode from server"
        }
    }
}

public struct XYZ {
    
}
