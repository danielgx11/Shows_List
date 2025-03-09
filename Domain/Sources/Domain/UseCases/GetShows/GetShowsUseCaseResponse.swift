//
//  GetShowsUseCaseResponse.swift
//
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

public struct GetShowsUseCaseResponse: Codable {
    public let id: Int
    public let name: String
    public let language: String?
    public let genres: [String]
    public let rating: RatingData?
    public let image: ImageData?
    public let summary: String?

    public init(id: Int, name: String, language: String?, genres: [String], rating: RatingData?, image: ImageData?, summary: String?) {
        self.id = id
        self.name = name
        self.language = language
        self.genres = genres
        self.rating = rating
        self.image = image
        self.summary = summary
    }
}

public struct RatingData: Codable {
    public let average: Double?
    
    public init(average: Double?) {
        self.average = average
    }
}

public struct ImageData: Codable {
    public let medium: String?
    public let original: String?
    
    public init(medium: String?, original: String?) {
        self.medium = medium
        self.original = original
    }
}
