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
    
    @IBOutlet weak var playerTurn: UILabel!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //Takes the "sender" and makes it a GameButton that automatiically toggles between playerOne and playerTwo
    @IBAction func buttonPressed(_ sender: GameButton) {
        let turn = gameBrain.playerTurn //refer to gameBrain
        
        sender.setTitle(turn.rawValue, for: .normal) //Change[x,o]
        
        gameBrain.updateBrain(x: sender.row, y: sender.col) //change accpording to sender
        
        sender.isEnabled = false
        //sender.backgroundColor = .black
        if turn.rawValue == "X" {
            playerTurn.text = "O's Turn"
        } else {
            playerTurn.text = "X's Turn"
        }
    }
    
    
   
    
    
    @IBAction func restartGame(_ sender: UIButton) {
        for button in allButtons {
            button.setTitle(nil, for: .normal)
            button.isEnabled = true
            playerTurn.text = "New Game!"
        }
    }
    
}

