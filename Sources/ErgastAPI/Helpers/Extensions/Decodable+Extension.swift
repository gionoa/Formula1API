//
//  File.swift
//  
//
//  Created by Giovanni Noa on 5/8/20.
//

import Foundation

extension Decodable {
    static func decode(from: Data,
                       using decoder: JSONDecoder = JSONDecoder()) throws -> Self {
        return try decoder.decode(self, from: from)
    }
}
