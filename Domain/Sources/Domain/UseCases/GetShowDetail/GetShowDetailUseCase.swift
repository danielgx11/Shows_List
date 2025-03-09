//
//  GetShowDetailUseCase.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

public final class GetShowDetailUseCase {
    let service: ServiceManagerProtocol
    
    public init(service: ServiceManagerProtocol) {
        self.service = service
    }
}

extension GetShowDetailUseCase: GetShowDetailUseCaseProtocol {
    
    public func execute(for identifier: String) async throws -> GetShowDetailUseCaseResponse {
        try await service.fetchTVShow(with: identifier)
    }
}
