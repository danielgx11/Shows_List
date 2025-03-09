//
//  ShowDetailViewState.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

enum ShowDetailViewState {
    case hasData(ShowDetailViewEntity)
    case hasError(message: String)
    case loading
}
