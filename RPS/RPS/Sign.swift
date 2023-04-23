//
//  Sign.swift
//  RPS
//
//  Created by craig murphy on 3/12/23.
//

import Foundation

//generate a random sign
//Need to remember that I cannot end with a else if on if statements
func randomSign() -> Sign {
    let sign = Int.random(in: 0...2)
    if sign == 0 {
        return .rock
    } else if sign == 1 {
        return .paper
    } else {
        return .scissors
    }
}


enum Sign {
    case rock, paper, scissors
    
    
    var sign: String {
        switch self {
        case .rock: return "👊"
        case .paper: return "✋"
        case .scissors: return "✌️"
        }
    }
    
    
    
    func compareSigns(opponentSign: Sign) -> GameStates{
        //check for the same type
        if (opponentSign == self){
            return .draw
        } else if (opponentSign == .paper && self == .rock){
            return .lose
        } else if (opponentSign == .scissors && self == .paper) {
            return .lose
        } else if (opponentSign == .rock && self == .scissors) {
            return .lose
        } else {
            return .win
        }
    }
}
