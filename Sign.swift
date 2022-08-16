//
//  File.swift
//  RPS
//
//  Created by Ryan Chappelle on 8/11/22.
//

import Foundation

func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    }
    else if sign == 1 {
        return .paper
    }
    else {
        return .scissors
    }
}

enum Sign {
    case rock, paper, scissors
    var signEmoji: String {
        switch self {
            case .rock: return "👊"
            case .paper: return "🖐"
            case .scissors: return "✌️"
        }
    }
    func signComparison(opponent: Sign) -> gameState {
        switch self {
        case .rock: if opponent == .rock { return .draw }
            else if opponent == .paper { return .lose }
            else { return .win }
            
        case .paper: if opponent == .rock { return .win }
            else if opponent == .paper { return .draw }
            else { return .lose }
            
        case .scissors: if opponent == .rock { return .lose }
            else if opponent == .paper { return .win }
            else { return .lose }
        }
    }
}



