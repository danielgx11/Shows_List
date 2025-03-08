//
//  ErrorView.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI
import Commons

struct ErrorView: View {
    
    // MARK: - CONSTANTS
    
    private enum Constants {
        static let errorIconName = "error-icon"
    }
    
    // MARK: - PROPERTIES
    
    let textMessage: String
    
    // MARK: - UI
    
    var body: some View {
        VStack(spacing: Metrics.small) {
            Image(Constants.errorIconName)
                .resizable()
                .scaledToFit()
                .frame(width: Metrics.huge, height: Metrics.huge)
            
            Text(textMessage)
                .foregroundStyle(Color.secondary)
                .font(.headline)
        }
        .frame(
            maxWidth: .infinity,
            maxHeight: .infinity,
            alignment: .center
        )
    }
}

#Preview {
    ErrorView(textMessage: "Something went wrong here")
}
