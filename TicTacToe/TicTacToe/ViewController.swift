//
//  ViewController.swift
//  TicTacToe
//
//  Created by Joshua Viera on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var gameBrain: TicTacToeBrain = TicTacToeBrain()
    
    @IBOutlet var allButtons: [UIButton]!
    @IBOutlet weak var playerOne: UILabel!
    @IBOutlet weak var playerTwo: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var winLabel: UILabel!
    @IBOutlet weak var playerTurn: UILabel!
    
    var winCounterOne = 0
    var winCounterTwo = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func reset() {
        allButtons.forEach({$0.isEnabled = false})
        gameBrain.resetGameBoard()
    }
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        
        switch gameBrain.playerTurn {
        case .playerOne: gameBrain.gameboard[sender.row][sender.col] = .x
        playerTurn.text = "O's Turn"
        sender.setTitle(gameBrain.playerTurn.rawValue, for: .normal)
        case .playerTwo: gameBrain.gameboard[sender.row][sender.col] = .o
        playerTurn.text = "X's Turn"
        sender.setTitle(gameBrain.playerTurn.rawValue, for: .normal)
        }
        sender.isEnabled = false
        
        switch gameBrain.checkForWin(){
        case .player1Wins :
            winCounterOne += 1
            playerOne.text = "Player1 X: \(winCounterOne)"
            winLabel.text = "Player X Wins!"
            score.text = "Score:"
            reset()
        case .player2Wins :
            winCounterTwo += 1
            playerTwo.text = "Player2 O: \(winCounterTwo)"
            winLabel.text = "Player O Wins!"
            score.text = "Score:"
            reset()
        case .onGoing :
            winLabel.text = ""
        case .tie :
            winLabel.text = "ITS A TIE !"
        }
        gameBrain.playerTurn.toggle()
    }

    @IBAction func restartGame(_ sender: UIButton) {
        for button in allButtons {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
            winLabel.text = ""
            playerTurn.text = ""
            score.text = ""
        }
    }
}

