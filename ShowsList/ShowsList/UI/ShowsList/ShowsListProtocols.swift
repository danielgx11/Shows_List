//
//  ShowsListProtocols.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation
import Combine

protocol ShowsListViewModelProtocol: ObservableObject {
    var viewEntity: ShowsListViewEntity? { get set }
    var viewState: ShowsListViewState { get }
    
    func initState()
}
