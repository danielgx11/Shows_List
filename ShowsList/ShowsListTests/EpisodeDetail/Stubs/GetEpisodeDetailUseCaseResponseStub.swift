//
//  GetEpisodeDetailUseCaseResponseStub.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain

extension GetEpisodeDetailUseCaseResponse {
    
    static func stub() -> GetEpisodeDetailUseCaseResponse {
        .init(
            id: 1,
            name: "Downtown",
            season: 1,
            number: 1,
            summary: "<b>Summary<b>",
            image: .init(medium: "", original: "")
        )
    }
}
