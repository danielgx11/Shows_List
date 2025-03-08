//
//  ShowsListContentView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI
import Commons

struct ShowsListContentView: View {
    
    // MARK: - PROPERTIES
    
    private let viewEntity: ShowsListViewEntity
    
    init(viewEntity: ShowsListViewEntity) {
        self.viewEntity = viewEntity
    }
    
    // MARK: - UI
    
    var body: some View {
        ScrollView {
            LazyVStack(content: {
                ForEach(viewEntity.shows, id: \.id) { show in
                    TVShowViewCell(viewEntity: show)
                }
            })
            .padding(Metrics.medium)
        }
    }
}

#Preview {
    ShowsListContentView(viewEntity: .stub())
}
