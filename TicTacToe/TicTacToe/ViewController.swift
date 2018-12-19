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
    //This is the shit im working on rihgt now
    
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
        winLabel.text = ""
    }
    
    @IBAction func buttonPressed(_ sender: GameButton) {
        //this is updating the gameBrain
        switch gameBrain.playerTurn {
        case .playerOne: gameBrain.gameboard[sender.row][sender.col] = .x
             sender.setTitle(gameBrain.playerTurn.rawValue, for: .normal)
        case .playerTwo: gameBrain.gameboard[sender.row][sender.col] = .o
             sender.setTitle(gameBrain.playerTurn.rawValue, for: .normal)
        }
        //        print(gameBrain.gameboard)
        sender.isEnabled = false
        switch gameBrain.checkForWin(){
        case .player1Wins:
            winLabel.text = "Player One Won"
            winCounterOne += 1
            playerOne.text = "Player1: \(winCounterOne)"
            reset()
        case .player2Wins:
            winLabel.text = "Player Two Won"
            winCounterTwo += 1
            playerTwo.text = "Player2: \(winCounterTwo)"
            reset()
            
        case .onGoing: winLabel.text = ""
        case .tie : winLabel.text = "ITS A TIE !"
        }
        gameBrain.playerTurn.toggle()
    }
    
    
    
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        for button in allButtons {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
        }
    }
    
}

