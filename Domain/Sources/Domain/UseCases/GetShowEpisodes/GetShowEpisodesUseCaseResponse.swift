//
//  GetShowEpisodesUseCaseResponse.swift
//  Domain
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

public struct GetShowEpisodesUseCaseResponse: Codable {
    
    public let id: Int
    public let name: String
    public let season: Int
    public let number: Int
    
}
