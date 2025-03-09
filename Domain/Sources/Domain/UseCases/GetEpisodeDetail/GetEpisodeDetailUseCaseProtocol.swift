//
//  GetEpisodeDetailUseCaseProtocol.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

public protocol GetEpisodeDetailUseCaseProtocol {
    func execute(for identifier: String) async throws -> GetEpisodeDetailUseCaseResponse
}
