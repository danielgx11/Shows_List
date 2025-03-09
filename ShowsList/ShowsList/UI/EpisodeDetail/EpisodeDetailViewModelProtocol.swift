//
//  EpisodeDetailViewModelProtocol.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation
import Combine

protocol EpisodeDetailViewModelProtocol: ObservableObject {
    var viewEntity: EpisodeDetailViewEntity? { get set }
    var viewState: EpisodeDetailViewState { get }
    
    func initState()
}
