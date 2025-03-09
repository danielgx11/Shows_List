//
//  GetShowDetailUseCaseSpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain
import Commons

class GetShowDetailUseCaseSpy: GetShowDetailUseCaseProtocol {

    var shouldThrowError = false
    private(set) var fetchShowDetailCalled = false

    func execute(for identifier: String) async throws -> GetShowDetailUseCaseResponse {
        fetchShowDetailCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return .stub()
    }
    
}
