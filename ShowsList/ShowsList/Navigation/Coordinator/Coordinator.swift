//
//  Coordinator.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Combine
import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var sheet: Sheet?
    
    let factory: ShowsListFactoryProtocol
    
    init(factory: ShowsListFactoryProtocol = ShowsListFactoryImplementation()) {
        self.factory = factory
    }

    func push(page: AppPages) {
        path.append(page)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    func presentSheet(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .showsList:
            AnyView(factory.makeShowsListView())
        case let .showDetail(identifier):
            AnyView(factory.makeShowDetailView(with: identifier))
        }
    }
    
    @ViewBuilder
    func buildSheet(sheet: Sheet) -> some View {
        switch sheet {
        case let .episodeDetails(identifier):
            AnyView(factory.makeEpisodeDetailView(with: identifier))
        }
    }
    
}
