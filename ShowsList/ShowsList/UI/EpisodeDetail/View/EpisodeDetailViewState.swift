//
//  EpisodeDetailViewState.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

enum EpisodeDetailViewState {
    case hasData(EpisodeDetailViewEntity)
    case hasError(message: String)
    case loading
}
