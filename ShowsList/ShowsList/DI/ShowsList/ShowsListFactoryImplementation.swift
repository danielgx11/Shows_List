//
//  ShowsListFactoryImplementation.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation
import Domain
import Networking
import SwiftUI

struct ShowsListFactoryImplementation: ShowsListFactoryProtocol {
    
    func makeShowsListView() -> any View {
        let service = ServiceManager()
        let useCase = GetShowsUseCase(service: service)
        let factory = ShowsListViewFactory()
        let viewModel = ShowsListViewModel(useCase: useCase, factory: factory)
        let view = ShowsListView(viewModel: viewModel)
        
        return view
    }
}
