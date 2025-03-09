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
    var items: [ShowsListViewEntity.TVShowEntity] { get }
    var itemsSearchedByName: [ShowsListViewEntity.TVShowEntity] { get }
    var isFetching: Bool { get }
    var isFetchingByName: Bool { get }
    var isSearchingByName: Bool { get }
    var searchText: String { get set }
    
    func initState()
    func fetchMoreItems()
}
