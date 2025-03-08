//
//  ViewFactoryProtocol.swift
//
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

public protocol ViewFactoryProtocol {
    func buildErrorMessage(with error: Error) -> String
}

extension ViewFactoryProtocol {
    
    public func buildErrorMessage(with error: Error) -> String {
        if let serviceError = error as? ServiceError {
            return "Service Error: \(serviceError.localizedDescription)"
        }
        
        return "Unknown Error: \(error.localizedDescription)"
    }
}
