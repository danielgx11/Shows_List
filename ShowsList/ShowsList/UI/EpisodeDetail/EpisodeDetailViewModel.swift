//
//  EpisodeDetailViewModel.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation
import Domain
import Commons

final class EpisodeDetailViewModel: EpisodeDetailViewModelProtocol {
    
    // MARK: - PROPERTIES
    
    @Published var viewState: EpisodeDetailViewState = .loading
    
    var viewEntity: EpisodeDetailViewEntity?
    
    private let getEpisodeDetailUseCase: GetEpisodeDetailUseCaseProtocol?
    private let factory: EpisodeDetailViewFactoryProtocol?
    
    private let episodeIdentifier: String
    
    // MARK: - INITIALIZERS
    
    init(
        getEpisodeDetailUseCase: GetEpisodeDetailUseCaseProtocol?,
        factory: EpisodeDetailViewFactoryProtocol?,
        episodeIdentifier: String
    ) {
        self.getEpisodeDetailUseCase = getEpisodeDetailUseCase
        self.factory = factory
        self.episodeIdentifier = episodeIdentifier
    }
    
    // MARK: - PUBLIC API
    
    func initState() {
        Task { [weak self] in
            guard let self else {
                return
            }
            
            await self.fetchEpisodeDetail()
        }
    }
}

// MARK: - METHODS

extension EpisodeDetailViewModel {
    
    private func fetchEpisodeDetail() async {
        do {
            guard let response = try await getEpisodeDetailUseCase?.execute(for: episodeIdentifier),
            let entity = factory?.buildViewEntity(with: response) else {
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
}
