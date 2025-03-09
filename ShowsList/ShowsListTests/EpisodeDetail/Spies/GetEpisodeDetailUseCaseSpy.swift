//
//  GetEpisodeDetailUseCaseSpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain
import Commons

class GetEpisodeDetailUseCaseSpy: GetEpisodeDetailUseCaseProtocol {

    var shouldThrowError = false
    private(set) var fetchEpisodeDetailCalled = false

    func execute(for identifier: String) async throws -> GetEpisodeDetailUseCaseResponse {
        fetchEpisodeDetailCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return .stub()
    }
    
}
