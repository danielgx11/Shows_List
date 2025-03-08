//
//  ShowsListViewState.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 07/03/25.
//

import Foundation

enum ShowsListViewState {
    case hasData(ShowsListViewEntity)
    case hasError(message: String)
    case loading
}
