//
//  EpisodeDetailViewEntity.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

struct EpisodeDetailViewEntity {
    
    let id: Int
    let season: Int
    let number: Int
    let name: String
    let summary: String
    let imageUrl: URL?
}

#if DEBUG

extension EpisodeDetailViewEntity {
    
    static func stub() -> EpisodeDetailViewEntity {
        .init(
            id: 1,
            season: 1,
            number: 2,
            name: "Episode 2",
            summary: "Episode 1 summary",
            imageUrl: nil
        )
    }
}

#endif
