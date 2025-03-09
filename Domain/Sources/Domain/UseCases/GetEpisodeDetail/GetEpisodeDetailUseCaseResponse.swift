//
//  GetEpisodeDetailUseCaseResponse.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

public struct GetEpisodeDetailUseCaseResponse: Codable {
    
    public let id: Int
    public let name: String
    public let season: Int
    public let number: Int
    public let summary: String
    public let image: ImageData?
    
    public init(id: Int, name: String, season: Int, number: Int, summary: String, image: ImageData?) {
        self.id = id
        self.name = name
        self.season = season
        self.number = number
        self.summary = summary
        self.image = image
    }
}
