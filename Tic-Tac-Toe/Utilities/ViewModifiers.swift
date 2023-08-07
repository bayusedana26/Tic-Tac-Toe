//
//  ViewModifiers.swift
//  Tic-Tac-Toe
//
//  Created by Bayu Sedana on 07/08/23.
//

import SwiftUI

struct NavStackContainer<Content: View>: View {
    @ViewBuilder
    var body: some View {
        if #available(iOS 16, *) {
            NavigationStack {
                content
            }
        } else {
            NavigationView {
                content
            }
            .navigationViewStyle(.stack)
        }
    }
    
    let content: Content
}

extension View {
    public func inNavigationStack() -> some View {
        return NavStackContainer(content: self)
    }
}
