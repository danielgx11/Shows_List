//
//  ShowsListContentView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI
import Commons

struct ShowsListContentView<ViewModel: ShowsListViewModelProtocol>: View {
    
    // MARK: - PROPERTIES
    
    @StateObject var viewModel: ViewModel
    
    let viewEntity: ShowsListViewEntity
    
    let onTapCellGestureAction: ((Int) -> Void)?

    // MARK: - UI
    
    var body: some View {
        ScrollView {
            
            if viewModel.isFetchingByName  {
                loadingView()
            } else {
                LazyVStack(content: {
                    ForEach(viewModel.isSearchingByName ? viewModel.itemsSearchedByName : viewModel.items, id: \.id) { show in
                        TVShowViewCell(viewEntity: show)
                            .onTapGesture {
                                onTapCellGestureAction?(show.id)
                            }
                            .onAppear {
                                if show.id == viewModel.items.last?.id {
                                    viewModel.fetchMoreItems()
                                }
                            }
                    }
                    
                    if viewModel.isFetching {
                        loadingView()
                    }
                })
                .padding(Metrics.medium)
            }
        }
    }
    
    private func loadingView() -> some View {
        ProgressView()
            .frame(maxWidth: .infinity)
            .frame(height: Metrics.big)
            .padding(.vertical)
    }
}

#Preview {
    let viewModel = ShowsListViewModel(useCase: nil, factory: nil)
    ShowsListContentView(viewModel: viewModel, viewEntity: .stub(), onTapCellGestureAction: nil)
}
