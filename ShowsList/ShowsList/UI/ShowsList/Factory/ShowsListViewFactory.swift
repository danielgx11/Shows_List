//
//  ShowsListViewFactory.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Domain
import Commons

protocol ShowsListViewFactoryProtocol: ViewFactoryProtocol { 
    
    func buildViewEntity(with data: [GetShowsUseCaseResponse]) -> ShowsListViewEntity
}

struct ShowsListViewFactory: ShowsListViewFactoryProtocol {
    
    func buildViewEntity(with data: [GetShowsUseCaseResponse]) -> ShowsListViewEntity {
        .init(shows: makeShowsEntity(with: data))
    }
    
    private func makeShowsEntity(with data: [GetShowsUseCaseResponse]) -> [ShowsListViewEntity.TVShowEntity] {
        data.map { item in
                .init(
                    id: item.id,
                    name: item.name,
                    language: item.language,
                    genres: item.genres.map { $0 },
                    rating: item.rating?.average ?? .zero,
                    imageUrl: item.image?.original,
                    summary: item.summary
                )
        }
    }
}
