//
//  GetShowDetailUseCaseResponse.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

public struct GetShowDetailUseCaseResponse: Codable {
    
    public let id: Int
    public let name: String
    public let summary: String
    public let premiered: String
    public let ended: String
    public let language: String
    public let genres: [String]
    public let rating: RatingData?
    public let image: ImageData?
    
    public init(
        id: Int,
        name: String,
        summary: String,
        premiered: String,
        ended: String,
        language: String,
        genres: [String],
        rating: RatingData?,
        image: ImageData?
    ) {
        self.id = id
        self.name = name
        self.summary = summary
        self.premiered = premiered
        self.ended = ended
        self.language = language
        self.genres = genres
        self.rating = rating
        self.image = image
    }
}
