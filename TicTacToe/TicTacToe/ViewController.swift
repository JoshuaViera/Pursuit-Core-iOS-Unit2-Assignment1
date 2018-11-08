//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var firstButton: GameButton!
    
  override func viewDidLoad() {
    super.viewDidLoad()
    print("We are making tic tac toe")
    if firstButton.row == 0 {
        print("eat my shorts!")
    }
    // Do any additional setup after loading the view, typically from a nib.
  }


}

