//
//  ShowsListViewModel.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Domain

final class ShowsListViewModel: ShowsListViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    @Published var viewState: ShowsListViewState = .loading
    
    var viewEntity: ShowsListViewEntity?
    
    private let useCase: GetShowsUseCaseProtocol?
    private let factory: ShowsListViewFactoryProtocol?
    
    // MARK: - INITIALIZERS
    
    init(useCase: GetShowsUseCaseProtocol?, factory: ShowsListViewFactoryProtocol?) {
        self.useCase = useCase
        self.factory = factory
    }
    
    // MARK: - PUBLIC API
    
    func initState() {
        Task { [weak self] in
            self?.fetchShows()
        }
    }
}

// MARK: - PRIVATE METHODS

extension ShowsListViewModel {
    
    private func fetchShows() {
        Task {
            do {
                let response = try await useCase?.execute()
                
                guard let viewEntity = factory?.buildViewEntity(with: response ?? []) else {
                    return
                }
                
                await MainActor.run {
                    viewState = .hasData(viewEntity)
                }
            } catch {
                await MainActor.run {
                    viewState = .hasError(message: factory?.buildErrorMessage(with: error) ?? "")
                }
            }
                
        }
    }
    
}
