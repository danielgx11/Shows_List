//
//  ServiceError.swift
//  
//
//  Created by Daniel Gomes Xavier on 24/02/25.
//

import Foundation

public enum ServiceError: LocalizedError {
    case invalidUrl
    case invalidResponse
    case invalidStatusCode
    case badRequest
    case unauthorized
    case forbidden
    case notFound
    case serverError
    case unknownStatusCode(Int)
    case dataTypeMismatch
    case decodingFailed(Error)
    case networkFailure(Error)
    case unknown(Error)
    
    public var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "The URL is invalid"
        case .invalidResponse:
            return "The server response is invalid"
        case .invalidStatusCode:
            return "The status code is invalid"
        case .badRequest:
            return "Bad request."
        case .unauthorized:
            return "Unauthorized access."
        case .forbidden:
            return "Access to this resource is forbidden"
        case .notFound:
            return "The requested resource was not found"
        case .serverError:
            return "The server encountered an error."
        case let .unknownStatusCode(code):
            return "Unexpected status code: \(code)"
        case .dataTypeMismatch:
            return "The response data type does not match the expected type"
        case let .decodingFailed(error):
            return "Failed to decode the response: \(error.localizedDescription)"
        case let .networkFailure(error):
            return "A network error occurred: \(error.localizedDescription)"
        case let .unknown(error):
            return "An unknown error occurred: \(error.localizedDescription)"
        }
    }
}
