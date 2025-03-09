//
//  GetShowsUseCaseSpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain
import Commons

class GetShowsUseCaseSpy: GetShowsUseCaseProtocol {
    
    var shouldThrowError = false
    private(set) var fetchItemsByPageCalled = false
    private(set) var fetchItemsByNameCalled = false

    func execute(page: String) async throws -> [Domain.GetShowsUseCaseResponse] {
        fetchItemsByPageCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return [.stub()]
    }
    
    func execute(name: String) async throws -> Domain.GetShowsUseCaseResponse {
        fetchItemsByNameCalled = true
        
        if shouldThrowError {
            throw MessageError.default
        }
        
        return .stub()
    }
    
}
