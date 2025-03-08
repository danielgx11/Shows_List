//
//  ServiceManagerProtocol.swift
//
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

public protocol ServiceManagerProtocol {
    func fetchTVShows() async throws -> [GetShowsUseCaseResponse]
}
