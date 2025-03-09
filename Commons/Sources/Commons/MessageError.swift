//
//  MessageError.swift
//  Commons
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

public enum MessageError: Error {
    case `default`
    case failedToBuildViewEntity
    
    public var localizedDescription: String {
        switch self {
        case .default:
            return "Throws the default error message"
        case .failedToBuildViewEntity:
            return "Build view entity failed"
        }
    }
}
