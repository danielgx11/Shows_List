//
//  AsyncImageView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 09/03/25.
//

import SwiftUI
import Commons

struct AsyncImageView: View {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let placeholderImageName = "photo"
    }
    
    // MARK: - METRICS
    
    private enum ViewMetrics {
        static let placeholderOpacity = 0.5
    }
    
    // MARK: - PROPERTIES
    
    let url: URL?
    let imageFrame: CGSize

    // MARK: - UI
    
    var body: some View {
        AsyncImage(url: url, transaction: .init(animation: .spring)) { phase in
            switch phase {
            case .empty:
                loadingView()
            case .success(let image):
                imageRenderer(image)
            case .failure:
                placeholderImage()
            @unknown default:
                placeholderImage()
            }
        }
    }

    private func imageRenderer(_ image: Image) -> some View {
        image
            .resizable()
            .interpolation(.low)
            .clipShape(.rect(cornerRadius: Metrics.tiny))
            .scaledToFit()
            .frame(width: imageFrame.width, height: imageFrame.height)
    }

    private func placeholderImage() -> some View {
        Image(systemName: Constants.placeholderImageName)
            .resizable()
            .frame(width: imageFrame.width, height: imageFrame.height)
            .foregroundColor(.gray.opacity(ViewMetrics.placeholderOpacity))
    }

    private func loadingView() -> some View {
        ProgressView()
            .frame(width: Metrics.medium, height: Metrics.medium)
    }
}
