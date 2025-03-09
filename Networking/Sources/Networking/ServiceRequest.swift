//
//  ServiceRequest.swift
//  
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Domain

enum ServiceRequest {
    
    case getShows(page: String)
    case getShowsByName(String)
    case getShow(id: String)
    case getEpisodeDetail(id: String)
    case getEpisodesForShow(id: String)
    
    var baseUrl: String {
        switch self {
        case .getShows, .getShowsByName, .getEpisodeDetail, .getShow, .getEpisodesForShow: return "https://api.tvmaze.com"
        }
    }
    
    var path: String {
        switch self {
        case .getShows:
            return "/shows"
        case .getShowsByName:
            return "/singlesearch/shows"
        case let .getShow(id):
            return "/shows/\(id)"
        case let .getEpisodesForShow(id):
            return "/shows/\(id)/episodes"
        case let .getEpisodeDetail(id):
            return "/episodes/\(id)"

        }
    }
    
    var method: String {
        switch self {
        case .getShows, .getShowsByName, .getEpisodeDetail, .getShow, .getEpisodesForShow:
            return "GET"
        }
    }
    
    var queryParams: [String: Any]? {
        switch self {
        case .getEpisodeDetail, .getShow, .getEpisodesForShow:
            return nil
        case let .getShows(page):
            return ["page": page]
        case let .getShowsByName(name):
            return ["q": name]
        }
    }
}
