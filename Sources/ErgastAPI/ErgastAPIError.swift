//
//  File.swift
//  
//
//  Created by Giovanni Noa on 4/28/20.
//

import Foundation

// MARK: - Publisher Error
public enum ErgastAPIError: Error {
    case url(String)
    case network(String)
    case parsing(String)
}
