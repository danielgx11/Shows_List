//
//  EpisodeDetailViewFactory.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Domain
import Foundation
import Commons

protocol EpisodeDetailViewFactoryProtocol: ViewFactoryProtocol {
    
    func buildViewEntity(with data: GetEpisodeDetailUseCaseResponse) -> EpisodeDetailViewEntity
}

struct EpisodeDetailViewFactory: EpisodeDetailViewFactoryProtocol {
    
    func buildViewEntity(with data: GetEpisodeDetailUseCaseResponse) -> EpisodeDetailViewEntity {
        .init(
            id: data.id,
            season: data.season,
            number: data.number,
            name: data.name,
            summary: data.summary,
            imageUrl: URL(string: data.image?.original ?? "")
        )
    }
}
