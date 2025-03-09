//
//  GetShowsUseCaseResponseStub.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain

extension GetShowsUseCaseResponse {
    
    static func stub() -> GetShowsUseCaseResponse {
        .init(
            id: 1,
            name: "Downtown Abbey",
            language: "English",
            genres: ["Drama"],
            rating: .init(average: 9.9),
            image: .init(medium: "", original: ""),
            summary: "<b>Summary<b>"
        )
    }
}
