//
//  ServiceRequest.swift
//  
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Domain

enum ServiceRequest {
    
    case getShows
    case getShow(id: String)
    case getEpisodesForShow(id: String)
    
    var baseUrl: String {
        switch self {
        case .getShows, .getShow, .getEpisodesForShow: return "https://api.tvmaze.com"
        }
    }
    
    var path: String {
        switch self {
        case .getShows:
            return "/shows"
        case let .getShow(id):
            return "/shows/\(id)"
        case let .getEpisodesForShow(id):
            return "/shows/\(id)/episodes"

        }
    }
    
    var method: String {
        switch self {
        case .getShows, .getShow, .getEpisodesForShow:
            return "GET"
        }
    }
    
    var queryParams: [String: Any]? {
        switch self {
        case .getShows, .getShow, .getEpisodesForShow:
            return nil
        }
    }
}
