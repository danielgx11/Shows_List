//
//  ShowDetailViewFactory.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Domain
import Foundation
import Commons

protocol ShowDetailViewFactoryProtocol: ViewFactoryProtocol {
    
    func buildViewEntity(with data: GetShowDetailUseCaseResponse?, episodesData: [GetShowEpisodesUseCaseResponse]?) -> ShowDetailViewEntity?
}

struct ShowDetailViewFactory: ShowDetailViewFactoryProtocol {
    
    func buildViewEntity(with data: GetShowDetailUseCaseResponse?, episodesData: [GetShowEpisodesUseCaseResponse]?) -> ShowDetailViewEntity? {
        guard let data else {
            return nil
        }
        
        let episodes = makeEpisodes(with: episodesData)
        
        return .init(
            id: data.id,
            name: data.name,
            summary: data.summary,
            genres: data.genres,
            language: data.language,
            premiered: data.premiered,
            endedDate: data.ended,
            rating: data.rating?.average ?? .zero,
            imageUrl: URL(string: data.image?.original ?? ""),
            episodes: episodes
        )
    }
    
    private func makeEpisodes(with data: [GetShowEpisodesUseCaseResponse]?) ->[(season: Int, episodes: [ShowEpisodeEntity])] {
        guard let data else {
            return []
        }
        
        
        let episodesEntity = data.map { episodeData in
            ShowEpisodeEntity(
                id: episodeData.id,
                season: episodeData.season,
                name: episodeData.name
            )
        }
        
        let groupedEpisodes = Dictionary(grouping: episodesEntity, by: { $0.season })
        
        return groupedEpisodes.keys.sorted().map { ($0, groupedEpisodes[$0] ?? []) }
        }
}
