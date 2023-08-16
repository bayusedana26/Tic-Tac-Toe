//
//  ContentView.swift
//  Tic-Tac-Toe
//
//  Created by Bayu Sedana on 07/08/23.
//

import SwiftUI

struct StartView: View {
    
    // MARK: - Properties
    @EnvironmentObject var game: GameService
    @State private var gameType: GameType = .undetermined
    @AppStorage("yourName") var yourName: String = ""
    @State private var opponentName: String = ""
    @State private var startGame: Bool = false
    @FocusState private var focus: Bool
    @State private var changeName:Bool = false
    @State private var newName: String = ""
    init(yourName: String) {
        self.yourName = yourName
    }
    
    
    var body: some View {
        VStack {
            
            // MARK: - Choose your game mode
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Two Sharing Device").tag(GameType.single)
                Text("CPU").tag(GameType.bot)
                Text("Challenge Your Friend").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            
            Text(gameType.description)
                .padding()
            
            // MARK: - Fields
            VStack {
                switch gameType {
                    case .single:
                        VStack {
                            TextField("Opponent name", text: $opponentName)
                                .autocorrectionDisabled()
                        }
                    case .bot:
                        EmptyView()
                    case .peer:
                        EmptyView()
                    case .undetermined:
                        EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            
            // MARK: - Buttons condition
            if gameType != .peer {
                Button("Start Game") {
                    game.setupGame(gameType: gameType, player1Name: yourName, player2Name: opponentName)
                    focus = false
                    startGame = true
                }
                .buttonStyle(.borderedProminent)
                .disabled(gameType == .undetermined || gameType == .single && opponentName.isEmpty)
                
            Image("Launchscreen")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
                
            Text("Your name is \(yourName)")
                Button("Change name") {
                    changeName.toggle()
                }
                .buttonStyle(.bordered)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Tic Tac Toe")
        .fullScreenCover(isPresented: $startGame) {
            GameView()
        }
        .alert("Change Name", isPresented: $changeName, actions: {
            TextField("Change your name", text: $newName)
            Button("OK", role: .destructive) {
                yourName = newName
                exit(-1)
            }
            Button("Cancel", role: .cancel) {}
        }, message: {
            Text("Tap OK, relaunched the app and use the new name")
        })
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(yourName: "Sample")
            .environmentObject(GameService())
    }
}
