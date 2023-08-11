//
//  Tic_Tac_ToeApp.swift
//  Tic-Tac-Toe
//
//  Created by Bayu Sedana on 07/08/23.
//

import SwiftUI

@main
struct AppEntry: App {
    // MARK: - Properties
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
