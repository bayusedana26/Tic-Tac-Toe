//
//  SquareView.swift
//  Tic-Tac-Toe
//
//  Created by Bayu Sedana on 11/08/23.
//

import SwiftUI

struct SquareView: View {
    //MARK: - Properties
    @EnvironmentObject var game: GameService
    @EnvironmentObject var connectionManager: MPConnectionManager
    let index: Int
    
    var body: some View {
        Button {
            if !game.isThinking {
                game.makeMove(at: index)
            }
            if game.gameType == .peer {
                let gameMove = MPGameMove(action: .start, playerName: connectionManager.myPeerId.displayName, index: index)
                connectionManager.send(gameMove: gameMove)
            }
            
            game.makeMove(at: index)
        } label: {
            game.gameBoard[index].image
                .resizable()
                .frame(width: 100, height: 100)
        }
        .disabled(game.gameBoard[index].player != nil)
        .foregroundColor(.primary)

    }
}

struct SquareView_Previews: PreviewProvider {
    static var previews: some View {
        SquareView(index: 1)
            .environmentObject(GameService())
            .environmentObject(MPConnectionManager(yourName: "Sample"))
    }
}
