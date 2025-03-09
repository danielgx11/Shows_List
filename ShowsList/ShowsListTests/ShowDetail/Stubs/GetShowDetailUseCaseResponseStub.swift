//
//  GetShowDetailUseCaseResponseStub.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import Domain

extension GetShowDetailUseCaseResponse {
    
    static func stub() -> GetShowDetailUseCaseResponse {
        .init(
            id: 1,
            name: "Downtown Abbey",
            summary: "<b>Summary<b>",
            premiered: "2015/01/01",
            ended: "2019/01/01",
            language: "English",
            genres: ["Drama"],
            rating: .init(average: 9.9),
            image: .init(medium: "", original: "")
        )
    }
}
