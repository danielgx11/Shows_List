//
//  ShowDetailContentView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI
import Commons

struct ShowDetailContentView: View {
    
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
        static let messageErrorToLoadImage = "Image download failed sorry for the incovenience"
        static let premieredTitle = "Premiered"
        static let endedDateTitle = "Ended"
    }
    
    // MARK: - PROPERTIES
    
    private let viewEntity: ShowDetailViewEntity
    
    private var onDidTapEpisode: ((String) -> Void)?
    
    init(viewEntity: ShowDetailViewEntity, onDidTapEpisode: ((String) -> Void)?) {
        self.viewEntity = viewEntity
        self.onDidTapEpisode = onDidTapEpisode
    }
    
    // MARK: - UI
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Metrics.small) {
                if let imageUrl = viewEntity.imageUrl {
                    asyncImage(with: imageUrl)
                        .frame(maxWidth: .infinity)
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: Metrics.little))
                }

                lazyScrollableHStackView(items: viewEntity.genres)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                importantDatesView()
                
                Text(AttributedString(html: viewEntity.summary) ?? AttributedString())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.body)
                    .foregroundStyle(Color.black.opacity(ViewMetrics.summaryOpacity))
                
                episodesView()
            }
            .padding(.horizontal, Metrics.medium)
            .padding(.bottom, Metrics.small)
            .padding(.top, Metrics.little)
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
    
    private func lazyScrollableHStackView(items: [String]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(content: {
                ForEach(items, id: \.self) { item in
                    Text(item)
                        .padding(Metrics.tiny)
                        .background(Color.mint)
                        .clipShape(RoundedRectangle(cornerRadius: Metrics.small))
                }
            })
        }
    }
    
    private func importantDatesView() -> some View {
        HStack {
            VStack(spacing: Metrics.tiny) {
                Group {
                    Text(Constants.premieredTitle)
                        .font(.system(.subheadline, design: .default, weight: .semibold))

                    Text(viewEntity.premiered)
                        .font(.callout)
                        .foregroundStyle(Color.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            
            Spacer()
            
            VStack(spacing: Metrics.tiny) {
                Group {
                    Text(Constants.endedDateTitle)
                        .font(.system(.subheadline, design: .default, weight: .semibold))
                    
                    Text(viewEntity.endedDate)
                        .font(.callout)
                        .foregroundStyle(Color.black.opacity(0.7))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
    }
    
    private func episodesView() -> some View {
        VStack(spacing: Metrics.tiny) {
            Text("Episodes")
                .font(.title2)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            LazyVStack(spacing: Metrics.tiny) {
                ForEach(viewEntity.episodes, id: \.season) { season in
                    Section {
                        scrollableEpisodesHStackView(items: season.episodes)
                    } header: {
                        Text("Season \(season.season)")
                            .font(.title3)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
    }
    
    private func scrollableEpisodesHStackView(items: [ShowEpisodeEntity]) -> some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(content: {
                ForEach(items, id: \.id) { item in
                    Text(item.name)
                        .padding(Metrics.tiny)
                        .background(Color.mint)
                        .clipShape(RoundedRectangle(cornerRadius: Metrics.small))
                        .onTapGesture {
                            onDidTapEpisode?(String(item.id))
                        }
                }
            })
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
    ShowDetailContentView(viewEntity: .stub(), onDidTapEpisode: nil)
}
