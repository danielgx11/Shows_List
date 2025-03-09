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

}

public struct RatingData: Codable {
    public let average: Double?
}

public struct ImageData: Codable {
    public let medium: String?
    public let original: String?
}
