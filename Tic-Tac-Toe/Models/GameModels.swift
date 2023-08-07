//
//  GameModels.swift
//  Tic-Tac-Toe
//
//  Created by Bayu Sedana on 07/08/23.
//

import Foundation

enum GameType {
    case single, bot, peer, undetermined
    
    var description: String {
        switch self {
            case .single:
                return "Share your iPhone/iPad and play against your friend."
            case .bot:
                return "Play against CPU"
            case .peer:
                return "Invite someone near you."
            case .undetermined:
                return ""
        }
    }
}
