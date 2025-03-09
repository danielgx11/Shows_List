//
//  EpisodeDetailContentView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI
import Commons

struct EpisodeDetailContentView: View {
    
    // MARK: - METRICS
    
    private enum ViewMetrics {
        static let summaryOpacity = 0.7
    }
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let messageErrorToLoadImage = "Image download failed sorry for the incovenience"
        static let seasonTitle = "Season"
        static let episodeTitle = "Episode"
    }
    
    // MARK: - PROPERTIES
    
    private let viewEntity: EpisodeDetailViewEntity
    
    init(viewEntity: EpisodeDetailViewEntity) {
        self.viewEntity = viewEntity
    }
    
    // MARK: - UI
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Metrics.small) {
                Text(viewEntity.name)
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity, alignment: .leading)

                if let imageUrl = viewEntity.imageUrl {
                    asyncImage(with: imageUrl)
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: Metrics.little))
                }
                
                Group {
                    Text("\(Constants.seasonTitle) \(viewEntity.season)")
                    
                    Text("\(Constants.episodeTitle) \(viewEntity.number)")
                }
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(AttributedString(html: viewEntity.summary) ?? AttributedString())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .foregroundStyle(Color.black.opacity(ViewMetrics.summaryOpacity))
            }
            .padding(.horizontal, Metrics.medium)
            .padding(.bottom, Metrics.small)
            .padding(.top, Metrics.medium)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    private func asyncImage(with url: URL?) -> some View {
        AsyncImage(url: url, transaction: .init(animation: .spring)) { phase in
            switch phase {
            case .empty:
                loadingView()
            case let .success(image):
                image
                    .resizable()
                    .scaledToFit()
            default:
                errorView(message: Constants.messageErrorToLoadImage)
            }
        }
    }
    
    private func loadingView() -> some View {
        ProgressView()
            .progressViewStyle(.circular)
    }

    private func errorView(message: String) -> some View {
        ErrorView(textMessage: message)
            .padding()
    }
}

#Preview {
    EpisodeDetailContentView(viewEntity: .stub())
}
