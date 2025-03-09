//
//  ShowsListView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import SwiftUI

// MARK: - CONSTANTS

fileprivate enum Constants {
    static let navigationTitle = "Shows List"
    static let searchBarPrompt = "Look for something..."
}

struct ShowsListView<ViewModel>: View where ViewModel: ShowsListViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel: ViewModel
    
    // MARK: - UI
    
    var body: some View {
        ZStack {
            switch viewModel.viewState {
            case .hasData(let showsListViewEntity):
                ShowsListContentView(viewModel: viewModel, viewEntity: showsListViewEntity) { identifier in
                    coordinator.push(page: .showDetail(identifier: String(identifier)))
                }
                .navigationTitle(Constants.navigationTitle)
                .searchable(text: $viewModel.searchText, prompt: Constants.searchBarPrompt)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
            case .hasError(let message):
                errorView(message: message)
            case .loading:
                loadingView()
            }
        }
        .task {
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
    let viewModel = ShowsListViewModel(useCase: nil, factory: nil)
    return ShowsListView(viewModel: viewModel)
}
