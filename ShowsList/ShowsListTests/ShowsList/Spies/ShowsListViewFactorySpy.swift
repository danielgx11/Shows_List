//
//  ShowsListViewFactorySpy.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

@testable import ShowsList

import Domain

class ShowsListViewFactorySpy: ShowsListViewFactoryProtocol {
    
    private(set) var buildViewEntityCalled = false

    func buildViewEntity(with data: [GetShowsUseCaseResponse]) -> ShowsList.ShowsListViewEntity {
        buildViewEntityCalled = true
        
        return .stub()
    }
    
    
}
