//
//  ViewDidLoadModifier.swift
//  ShowsList
//
//  Created by Daniel Gomes Xavier on 08/03/25.
//

import SwiftUI

struct ViewDidLoadModifier: ViewModifier {
    
    @State private var viewDidLoad = false
    
    let action: (() -> Void)?
    
    func body(content: Content) -> some View {
        content
            .task {
                if !viewDidLoad {
                    viewDidLoad = true
                    action?()
                }
            }
    }
}

extension View {
    func onViewDidLoad(perform action: (() -> Void)? = nil) -> some View {
        self.modifier(ViewDidLoadModifier(action: action))
    }
}
