//
//  ShowDetailViewModel.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation
import Domain
import Commons

final class ShowDetailViewModel: ShowDetailViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    @Published var viewState: ShowDetailViewState = .loading
    
    var viewEntity: ShowDetailViewEntity?
    
    private let getShowDetailUseCase: GetShowDetailUseCaseProtocol?
    private let getEpisodesUseCase: GetShowEpisodesUseCaseProtocol?
    private let factory: ShowDetailViewFactoryProtocol?
    
    private let showIdentifier: String
    
    // MARK: - INITIALIZERS
    
    init(
        getShowDetailUseCase: GetShowDetailUseCaseProtocol?,
        getEpisodesUseCase: GetShowEpisodesUseCaseProtocol?,
        factory: ShowDetailViewFactoryProtocol?,
        showIdentifier: String
    ) {
        self.getShowDetailUseCase = getShowDetailUseCase
        self.getEpisodesUseCase = getEpisodesUseCase
        self.factory = factory
        self.showIdentifier = showIdentifier
    }
    
    // MARK: - PUBLIC API
    
    func initState() {
        Task { [weak self] in
            guard let self else {
                return
            }
            
            await self.fetchShowDetails(with: showIdentifier)
        }
    }
}

// MARK: - METHODS

extension ShowDetailViewModel {
    
    private func fetchShowDetails(with identifier: String?) async {
        guard let identifier else {
            return
        }
        
        async let showDetailResponse = fetchShow(with: identifier)
        async let episodesResponse = fetchEpisodes(with: identifier)
        
        do {
            let (showDetailResponse, episodesResponse) = try await (showDetailResponse, episodesResponse)
            
            guard let entity = factory?.buildViewEntity(with: showDetailResponse, episodesData: episodesResponse) else {
                return
            }
            
            await MainActor.run {
                viewState = .hasData(entity)
            }
        } catch {
            await MainActor.run {
                viewState = .hasError(message: factory?.buildErrorMessage(with: error) ?? "")
            }
        }
    }
    
    private func fetchShow(with identifier: String) async throws -> GetShowDetailUseCaseResponse {
        guard let response = try await getShowDetailUseCase?.execute(for: identifier) else {
            throw MessageError.default
        }
        
        return response
    }
    
    private func fetchEpisodes(with identifier: String) async throws -> [GetShowEpisodesUseCaseResponse] {
        guard let response = try await getEpisodesUseCase?.execute(for: identifier) else {
            throw MessageError.default
        }
    
        return response
    }
}
