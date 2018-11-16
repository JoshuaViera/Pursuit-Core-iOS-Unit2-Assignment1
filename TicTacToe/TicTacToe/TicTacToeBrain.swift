//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Joshua Viera on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//


import Foundation

class TicTacToeBrain {
    
    //creates an instance of player
    var playerTurn = Turn.playerOne
    
    //creates playerOne and Two
    enum Turn: String {
        case playerOne = "X"
        case playerTwo = "O"
        
        //changes between player one and player two
        mutating func toggle() {//mutating changes the value
            switch self {//changes which instance is being seleetced
            case .playerOne://player1 = player2
                self = .playerTwo
            case .playerTwo://player2 = player1
                self = .playerOne
            }
        }
    }
    
    //updates the brain with whos turn it is so it oculd replace it with the appropriate X,O
    func updateBrain(x: Int, y: Int){//connected to GameButton(row,column)
        playerTurn.toggle()
        let square: Square
        switch playerTurn {
        case .playerOne:
            square = .x
        case .playerTwo:
            square = .o
        }
    }
    
    // enum of the 3 state sthe gameboard can be in
    enum Square {
        case x // playerOne -> once clicked
        case o // playerTwo -> once clicked
        case empty // has not been clicked yet
    }
    
    // creating a matrix of Square [X,O,empty]
    // Game Board
    var gameboard =  [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
}
