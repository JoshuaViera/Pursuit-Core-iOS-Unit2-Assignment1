//
//  TicTacToeBrain.swift
//  TicTacToe
//
//  Created by Joshua Viera on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//


import Foundation

class TicTacToeBrain {
    
    enum Square: String {
        case x = "X"
        case o = "O"
        case empty = ""
    }
    
    var gameboard =  [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
    
    var playerTurn = Turn.playerOne
    
    enum Turn: String {
        case playerOne = "X"
        case playerTwo = "O"
        
        mutating func toggle() {
            switch self {
            case .playerOne:
                self = .playerTwo
            case .playerTwo:
                self = .playerOne
            }
        }
    }
    
    func checkForWin() -> GameState{
        //Horizontal
        for row in gameboard {
            if row == [Square.x, Square.x, Square.x] {
                return .player1Wins
            } else if row == [Square.o,Square.o,Square.o]{
                return .player2Wins
            }
        }
        //Vertical
        for colIndex in 0..<gameboard[0].count {
            var col = [Square]()
            for rowIndex in 0..<gameboard.count {
                col.append(gameboard[rowIndex][colIndex])
            }
            if col == [Square.x, Square.x, Square.x] {
                return .player1Wins
            } else if col == [Square.o,Square.o,Square.o]{
                return .player2Wins
            }
        }
        //Diagonal
        var diagonal1 = [Square]()
        for i in 0..<gameboard.count {
            diagonal1.append(gameboard[i][i])
        }
        if diagonal1 == [Square.x, Square.x, Square.x] {
            return .player1Wins
        } else if diagonal1 == [Square.o,Square.o,Square.o]{
            return .player2Wins
        }
        var diagonal2 = [Square]()
        for i in 0..<gameboard.count {
            diagonal2.append(gameboard[i][gameboard.count - 1 - i])
        }
        if diagonal2 == [Square.x, Square.x, Square.x] {
            return .player1Wins
        } else if diagonal2 == [Square.o,Square.o,Square.o]{
            return .player2Wins
        }
        return .onGoing
    }
    
    
    func resetGameBoard() {
        gameboard = [[Square]](repeating: [Square](repeating: .empty, count: 3), count: 3)
    }
    
    enum GameState {
        case player1Wins
        case player2Wins
        case tie
        case onGoing
    }    
}


