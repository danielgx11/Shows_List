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
    
    func makeShowDetailView(with identifier: String) -> any View {
        let service = ServiceManager()
        let getShowDetailUseCase = GetShowDetailUseCase(service: service)
        let getEpisodesUseCase = GetShowEpisodesUseCase(service: service)
        let factory = ShowDetailViewFactory()
        let viewModel = ShowDetailViewModel(
            getShowDetailUseCase: getShowDetailUseCase,
            getEpisodesUseCase: getEpisodesUseCase,
            factory: factory,
            showIdentifier: identifier
        )
        let view = ShowDetailView(viewModel: viewModel)
        
        return view
    }
    
    func makeEpisodeDetailView(with identifier: String) -> any View {
        let service = ServiceManager()
        let getEpisodeDetailUseCase = GetEpisodeDetailUseCase(service: service)
        let factory = EpisodeDetailViewFactory()
        let viewModel = EpisodeDetailViewModel(getEpisodeDetailUseCase: getEpisodeDetailUseCase, factory: factory, episodeIdentifier: identifier)
        let view = EpisodeDetailView(viewModel: viewModel)
        
        return view
    }
}
