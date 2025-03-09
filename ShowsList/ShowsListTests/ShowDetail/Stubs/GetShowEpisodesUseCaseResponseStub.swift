//
//  GetShowEpisodesUseCaseResponseStub.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain

extension GetShowEpisodesUseCaseResponse {
    
    static func stub() -> GetShowEpisodesUseCaseResponse {
        .init(
            id: 1,
            name: "Downtown",
            season: 1,
            number: 1
        )
    }
}
