//
//  NavigationScreens.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

enum AppPages: Hashable {
    case showsList
    case episode
}

enum Sheet: String, Identifiable {
    var id: String {
        self.rawValue
    }
    
    case episodeDetails
}
