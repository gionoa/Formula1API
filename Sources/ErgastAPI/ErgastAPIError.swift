//
//  ErgastAPIError.swift
//
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

// MARK: - Publisher Error
/// Enum for passing errors during network interactions.
public enum ErgastAPIError: Error {
    /// A URL error.
    case url(String)
    
    /// A  network error.
    case network(String)
    
    /// A parsing/decoding error.
    case parsing(String)
}
