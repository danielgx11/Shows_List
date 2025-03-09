//
//  EpisodeDetailViewFactorySpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

@testable import ShowsList

import Domain

class EpisodeDetailViewFactorySpy: EpisodeDetailViewFactoryProtocol {
    
    private(set) var buildViewEntityCalled = false

    func buildViewEntity(with data: GetEpisodeDetailUseCaseResponse) -> EpisodeDetailViewEntity {
        buildViewEntityCalled = true
        
        return .stub()
    }
    
}
