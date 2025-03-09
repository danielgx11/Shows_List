//
//  ShowsListFactoryProtocol.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import Foundation
import SwiftUI

protocol ShowsListFactoryProtocol {
    func makeShowsListView() -> any View
    func makeShowDetailView(with identifier: String) -> any View
    func makeEpisodeDetailView(with identifier: String) -> any View
}
