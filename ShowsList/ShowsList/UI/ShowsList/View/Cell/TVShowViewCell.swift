//
//  TVShowViewCell.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI
import Commons

struct TVShowViewCell: View {
    
    // MARK: - METRICS
    
    private enum ViewMetrics {
        static let summaryOpacity = 0.7
        static let backgroundOpacity = 0.7
        static let summaryLinesLimit = 4
        static let scrollContainerFrameCount = 2
        static let scrollContainerFrameSpan = 1
        static let starImageOffset: CGFloat = -1
    }
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let starSFImageName = "star.fill"
    }
    
    // MARK: - PROPERTIES
    
    private let viewEntity: ShowsListViewEntity.TVShowEntity
    
    init(viewEntity: ShowsListViewEntity.TVShowEntity) {
        self.viewEntity = viewEntity
    }
    
    // MARK: - UI
    
    var body: some View {
        VStack(spacing: Metrics.little) {
            HStack {
                Text(viewEntity.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                
                Spacer()
                
                AsyncImageView(url: viewEntity.imageUrl, imageFrame: CGSize(width: Metrics.huge, height: Metrics.huge))
            }
            
            HStack {
                Text(String(viewEntity.rating))
                    .font(.system(.body, design: .default, weight: .semibold))

                Image(systemName: Constants.starSFImageName)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(.yellow)
                    .frame(width: Metrics.small, height: Metrics.small)
                    .offset(y: ViewMetrics.starImageOffset)
                
                Spacer()
            }
            
            if let summary = viewEntity.summary {
                Text(summary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.callout)
                    .foregroundStyle(Color.black.opacity(ViewMetrics.summaryOpacity))
                    .lineLimit(ViewMetrics.summaryLinesLimit)
            }
        }
        .padding(Metrics.tiny)
        .background(Color.gray.opacity(ViewMetrics.backgroundOpacity))
        .clipShape(.rect(cornerRadius: Metrics.tiny))
        .shadow(radius: Metrics.little)
    }
    
    private func loadingView() -> some View {
        ProgressView()
            .frame(maxWidth: .infinity)
            .frame(height: Metrics.big)
            .padding(.vertical)
    }
}

#Preview {
    TVShowViewCell(viewEntity: ShowsListViewEntity.stub().shows.first!)
}
