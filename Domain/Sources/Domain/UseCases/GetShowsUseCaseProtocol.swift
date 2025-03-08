//
//  GetShowsUseCaseProtocol.swift
//  
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

public protocol GetShowsUseCaseProtocol {
    func execute() async throws -> [GetShowsUseCaseResponse]
}
