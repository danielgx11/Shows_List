//
//  ShowsListViewModel.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Domain
import Combine

final class ShowsListViewModel: ShowsListViewModelProtocol {
    
    // MARK: - METRICS
    
    private enum ViewModelMetrics {
        static let searchableDelayMilliseconds = 2000
    }
    
    // MARK: - PROPERTIES
    
    @Published var viewState: ShowsListViewState = .loading
    @Published var items: [ShowsListViewEntity.TVShowEntity] = []
    @Published var itemsSearchedByName: [ShowsListViewEntity.TVShowEntity] = []
    @Published var isFetching = false
    @Published var isFetchingByName = false
    @Published var isSearchingByName = false
    @Published var searchText: String = ""
    
    var viewEntity: ShowsListViewEntity?
    
    private let useCase: GetShowsUseCaseProtocol?
    private let factory: ShowsListViewFactoryProtocol?
    
    private var currentPage = 0
    
    private var cancellables = Set<AnyCancellable>()
    
    // MARK: - INITIALIZERS
    
    init(useCase: GetShowsUseCaseProtocol?, factory: ShowsListViewFactoryProtocol?) {
        self.useCase = useCase
        self.factory = factory
    }
    
    // MARK: - PUBLIC API
    
    func initState() {
        bindSearchable()
        
        Task { [weak self] in
           await self?.fetchShows()
        }
    }
    
    func fetchMoreItems() {
        if !isFetching {
            currentPage += 1
            
            Task { [weak self] in
                await self?.fetchShows()
            }
        }
    }
    
    func searchByName(_ showName: String) {
        isFetchingByName = true
        
        Task { [weak self] in
            await self?.fetchShowBy(name: showName)
        }
    }
}

// MARK: - PRIVATE METHODS

extension ShowsListViewModel {
    
    private func bindSearchable() {
        $searchText
            .debounce(for: .milliseconds(ViewModelMetrics.searchableDelayMilliseconds), scheduler: RunLoop.main)
            .removeDuplicates()
            .sink { [weak self] query in
                guard let self = self, !query.isEmpty else {
                    DispatchQueue.main.async {
                        self?.isSearchingByName = false
                    }
                    return
                }
                
                DispatchQueue.main.async {
                    self.isSearchingByName = true
                }
                
                self.searchByName(query)
            }
            .store(in: &cancellables)
    }
    
    private func fetchShows() async {
        if currentPage > .zero {
            await MainActor.run {
                isFetching = true
            }
        }
        
        do {
            let response = try await useCase?.execute(page: String(currentPage))
            
            guard let showsEntity = factory?.buildViewEntity(with: response ?? []) else {
                return
            }
            
            await MainActor.run {
                isFetching = false
                
                if currentPage == .zero {
                    viewEntity = showsEntity
                    viewState = .hasData(showsEntity)
                }
                
                items.append(contentsOf: showsEntity.shows)
            }
            
        } catch {
            await MainActor.run {
                viewState = .hasError(message: factory?.buildErrorMessage(with: error) ?? "")
                isFetching = false
            }
        }
    }

    private func fetchShowBy(name: String) async {
        do {
            guard let response = try await useCase?.execute(name: name),
                  let showsEntity = factory?.buildViewEntity(with: [response]) else {
                return
            }
            
            await MainActor.run {
                itemsSearchedByName = showsEntity.shows
                isFetchingByName = false
            }
        } catch {
            await MainActor.run {
                isFetchingByName = false
                isSearchingByName = false
            }
        }
    }
    
}
