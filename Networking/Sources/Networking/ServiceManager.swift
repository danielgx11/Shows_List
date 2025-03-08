//
//  ServiceManager.swift
//  
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Domain
import Commons

public final class ServiceManager {
    
    let urlSession = URLSession.shared
    let decoder = JSONDecoder()
    
    public init() { }
    
    // MARK: - METHODS
    
    private func fetch<T>(request: ServiceRequest, type: T.Type) async throws -> T where T : Decodable {
        do {
            let (data, response) = try await performRequest(for: request)
            try validateResponse(response, data: data)
            return try decodeData(data, as: type)
        } catch {
            throw mapError(error)
        }
    }
    
    private func performRequest(for request: ServiceRequest) async throws -> (Data, URLResponse) {
        guard let url = buildURL(from: request) else {
            throw ServiceError.invalidUrl
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.method
        
        return try await urlSession.data(for: urlRequest)
    }
    
    private func buildURL(from request: ServiceRequest) -> URL? {
        guard var urlComponents = URLComponents(string: request.baseUrl) else {
            return nil
        }
        
        urlComponents.path += request.path
        
        if let queryParams = request.queryParams {
            urlComponents.queryItems = queryParams.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
        }
        
        return urlComponents.url
    }
    
    private func validateResponse(_ response: URLResponse, data: Data) throws {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw ServiceError.invalidResponse
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return
        case 400:
            throw ServiceError.badRequest
        case 401:
            throw ServiceError.unauthorized
        case 403:
            throw ServiceError.forbidden
        case 404:
            throw ServiceError.notFound
        case 500...599:
            throw ServiceError.serverError
        default:
            throw ServiceError.unknownStatusCode(httpResponse.statusCode)
        }
    }
    
    private func decodeData<T>(_ data: Data, as type: T.Type) throws -> T where T: Decodable {
        if T.self == Data.self, let rawData = data as? T {
            return rawData
        }
        
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw ServiceError.decodingFailed(error)
        }
    }
    
    private func mapError(_ error: Error) -> ServiceError {
        if let serviceError = error as? ServiceError {
            return serviceError
        } else if (error as NSError).domain == NSURLErrorDomain {
            return .networkFailure(error)
        }
        
        return .unknown(error)
    }
}

// MARK: - SERVICE MANAGER PROTOCOL

extension ServiceManager: ServiceManagerProtocol {
    
    public func fetchTVShows() async throws -> [GetShowsUseCaseResponse] {
        let request = ServiceRequest.getShows
        
        return try await fetch(request: request, type: [GetShowsUseCaseResponse].self)
    }

}
