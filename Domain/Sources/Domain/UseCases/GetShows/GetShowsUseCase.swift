//
//  GetShowsUseCase.swift
//  
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

public final class GetShowsUseCase {
    let service: ServiceManagerProtocol
    
    public init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetShowsUseCase: GetShowsUseCaseProtocol {
    
    public func execute(page: String) async throws -> [GetShowsUseCaseResponse] {
        try await service.fetchTVShows(page: page)
    }
    
    public func execute(name: String) async throws -> GetShowsUseCaseResponse {
        try await service.fetchTVShowsBy(name: name)
    }
}
