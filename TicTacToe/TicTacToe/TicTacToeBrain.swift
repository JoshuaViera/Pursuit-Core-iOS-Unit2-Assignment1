//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Joshua Viera on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import Foundation

import Foundation

class TicTacToeBrain {
    //creates an instance of player
    var playerTurn = Turn.playerOne
    
    //creates playerOne and Two
    enum Turn: String {
        case playerOne = "X"
        case playerTwo = "O"
        
        //changes between player one and player two
        mutating func toggle() {
            switch self {
            case .playerOne:
                self = .playerTwo
            case .playerTwo:
                self = .playerOne
            }
        }
    }
    
    //updates the brain with whos turn it is so it oculd replace it with the appropriate X,O
    func updateBrain(x: Int, y: Int){
        playerTurn.toggle()
        let square: Square
        switch playerTurn {
        case .playerOne:
            square = .x
        case .playerTwo:
            square = .o
        }
    }
    //enum of the 3 state sthe gameboard can be in
    enum Square {
        case x
        case o
        case empty
    }
    
    //creating a matrix of Square [X,O,empty]
    var gameboard =  [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
}
