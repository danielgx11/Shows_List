//
//  GetShowEpisodesUseCase.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

public final class GetShowEpisodesUseCase {
    let service: ServiceManagerProtocol
    
    public init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetShowEpisodesUseCase: GetShowEpisodesUseCaseProtocol {
    
    public func execute(for identifier: String) async throws -> [GetShowEpisodesUseCaseResponse] {
        try await service.fetchTVShowEpisodes(with: identifier)
    }
}
