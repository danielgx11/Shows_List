//
//  ShowDetailViewModelProtocol.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation
import Combine

protocol ShowDetailViewModelProtocol: ObservableObject {
    var viewEntity: ShowDetailViewEntity? { get set }
    var viewState: ShowDetailViewState { get }
    
    func initState()
}
