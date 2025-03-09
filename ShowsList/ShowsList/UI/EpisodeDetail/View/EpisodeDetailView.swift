//
//  EpisodeDetailView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI

struct EpisodeDetailView<ViewModel>: View where ViewModel: EpisodeDetailViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject private var coodinator: Coordinator
    @StateObject var viewModel: ViewModel
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .hasData(let viewEntity):
                EpisodeDetailContentView(viewEntity: viewEntity)
                    .navigationTitle(viewEntity.name)
                    .toolbarTitleDisplayMode(.inlineLarge)
            case .hasError(let message):
                errorView(message: message)
            case .loading:
                loadingView()
            }
        }
        .onViewDidLoad {
            viewModel.initState()
        }
    }
    
    private func errorView(message: String) -> some View {
        ErrorView(textMessage: message)
            .padding()
    }

    private func loadingView() -> some View {
        ProgressView()
            .progressViewStyle(.circular)
    }
}

#Preview {
    let viewModel = EpisodeDetailViewModel(getEpisodeDetailUseCase: nil, factory: nil, episodeIdentifier: "1")
    EpisodeDetailView(viewModel: viewModel)
}
