//
//  GetShowsUseCaseProtocol.swift
//  
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

public protocol GetShowsUseCaseProtocol {
    func execute(page: String) async throws -> [GetShowsUseCaseResponse]
    func execute(name: String) async throws -> GetShowsUseCaseResponse
}
