//
//  ServiceManagerProtocol.swift
//
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

public protocol ServiceManagerProtocol {
    func fetchTVShows(page: String) async throws -> [GetShowsUseCaseResponse]
    func fetchTVShowsBy(name: String) async throws -> GetShowsUseCaseResponse
    func fetchTVShow(with identifier: String) async throws -> GetShowDetailUseCaseResponse
    func fetchTVShowEpisodes(with identifier: String) async throws -> [GetShowEpisodesUseCaseResponse]
    func fetchEpisodeDetail(with identifier: String) async throws -> GetEpisodeDetailUseCaseResponse
}
