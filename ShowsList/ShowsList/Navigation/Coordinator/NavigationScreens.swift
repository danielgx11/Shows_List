//
//  NavigationScreens.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

enum AppPages: Hashable {
    case showsList
    case showDetail(identifier: String)
}

enum Sheet: Identifiable {
    case episodeDetails(identifier: String)
    
    var id: String {
        switch self {
        case .episodeDetails(let identifier):
            return "episodeDetails_\(identifier)"
        }
    }
}
