//
//  ShowDetailViewEntity.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation

struct ShowDetailViewEntity {
    let id: Int
    let name: String
    let summary: String
    let genres: [String]
    let language: String
    let premiered: String
    let endedDate: String
    let rating: Double
    let imageUrl: URL?
    let episodes: [(season: Int, episodes: [ShowEpisodeEntity])]
}

struct ShowEpisodeEntity {
    let id: Int
    let season: Int
    let name: String
}

#if DEBUG

extension ShowDetailViewEntity {
    
    static func stub() -> ShowDetailViewEntity {
        .init(
            id: 1,
            name: "Under the Dome",
            summary: "<p><b>Under the Dome</b> is the story of a small town that is suddenly and inexplicably sealed off from the rest of the world by an enormous transparent dome.",
            genres: [
                "Drama",
                "Science-Fiction",
                "Thriller"
            ],
            language: "English",
            premiered: "2013-06-24",
            endedDate: "2015-09-10",
            rating: 6.5,
            imageUrl: URL(string: "https://static.tvmaze.com/uploads/images/original_untouched/81/202627.jpg"),
            episodes: .init()
        )
    }
}

#endif
