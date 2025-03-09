//
//  ShowsListViewEntity.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

struct ShowsListViewEntity {
    
    let shows: [TVShowEntity]
    
    struct TVShowEntity {
        let id: Int
        let name: String
        let language: String?
        let genres: [String]
        let rating: Double
        let imageUrl: URL?
        let summary: AttributedString?
    }
}

#if DEBUG

extension ShowsListViewEntity {
    
    static func stub() -> ShowsListViewEntity {
        .init(
            shows: [TVShowEntity.init(
                id: 1,
                name: "Marvel",
                language: "English",
                genres: ["Drama"],
                rating: 99.32,
                imageUrl: URL(string: ""),
                summary: "Marvel English Drama"
            )]
        )
    }
}

#endif
