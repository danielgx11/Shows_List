//
//  ShowDetailViewFactorySpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

@testable import ShowsList

import Domain

class ShowDetailViewFactorySpy: ShowDetailViewFactoryProtocol {
    
    private(set) var buildViewEntityCalled = false

    func buildViewEntity(with data: GetShowDetailUseCaseResponse?, episodesData: [GetShowEpisodesUseCaseResponse]?) -> ShowDetailViewEntity? {
        buildViewEntityCalled = true
        
        return .stub()
    }
    
}
