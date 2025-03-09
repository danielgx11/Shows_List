//
//  GetShowEpisodesUseCaseSpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain
import Commons

class GetShowEpisodesUseCaseSpy: GetShowEpisodesUseCaseProtocol {

    var shouldThrowError = false
    private(set) var fetchEpisodesCalled = false

    func execute(for identifier: String) async throws -> [GetShowEpisodesUseCaseResponse] {
        fetchEpisodesCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return [.stub()]
    }
    
}
