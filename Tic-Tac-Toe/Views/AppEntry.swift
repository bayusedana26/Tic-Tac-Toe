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
    @AppStorage("yourName") var yourName = ""
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            if yourName.isEmpty {
                YourNameView()
            } else {
                StartView(yourName: yourName)
                    .environmentObject(game)
            }
        }
    }
}
