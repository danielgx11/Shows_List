//
//  GetEpisodeDetailUseCase.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

public final class GetEpisodeDetailUseCase {
    let service: ServiceManagerProtocol
    
    public init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetEpisodeDetailUseCase: GetEpisodeDetailUseCaseProtocol {
    
    public func execute(for identifier: String) async throws -> GetEpisodeDetailUseCaseResponse {
        try await service.fetchEpisodeDetail(with: identifier)
    }
}
