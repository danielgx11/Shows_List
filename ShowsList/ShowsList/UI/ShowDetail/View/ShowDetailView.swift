//
//  ShowDetailView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI

struct ShowDetailView<ViewModel>: View where ViewModel: ShowDetailViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel: ViewModel
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .hasData(let viewEntity):
                ShowDetailContentView(viewEntity: viewEntity) {
                    coordinator.presentSheet(.episodeDetails(identifier: $0))
                }
                .navigationTitle(viewEntity.name)
                .toolbarTitleDisplayMode(.inlineLarge)
            case .hasError(let message):
                errorView(message: message)
            case .loading:
                loadingView()
            }
        }
        .onViewDidLoad() {
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
    let viewModel = ShowDetailViewModel(getShowDetailUseCase: nil, getEpisodesUseCase: nil, factory: nil, showIdentifier: "1")
    ShowDetailView(viewModel: viewModel)
}
