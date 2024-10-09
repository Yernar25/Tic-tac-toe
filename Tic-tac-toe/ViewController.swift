//
//  ViewController.swift
//  Tic-tac-toe
//
//  Created by Yernar Dyussenbekov on 08.10.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winArray = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6] ]
    var hasWinner = false
    var player = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func game(_ sender: UIButton) {
        
        if arrayBoard[sender.tag - 1] != 0 {
            return
        }
            
        if player == 1 {
            arrayBoard[sender.tag - 1] = player
            sender.setBackgroundImage(UIImage(named: "x"), for: .normal)
            player = 2
        } else {
            arrayBoard[sender.tag - 1] = player
            sender.setBackgroundImage(UIImage(named: "0"), for: .normal)
            player = 1
        }
        
        for win in winArray {
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 1 {
                hasWinner = true
                let alert = UIAlertController(title: "Winner", message: "Player X Win!!! \n\n Restart Game?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {UIActionHandler in self.clearBoard()}))
                present(alert, animated: true)
                break
            }
            
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 2 {
                hasWinner = true
                let alert = UIAlertController(title: "Winner", message: "Player O Win!!! \n\n Restart Game?", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {UIActionHandler in self.clearBoard() }))
                present(alert, animated: true)
                break
            }
        }
        
        if !arrayBoard.contains(0) && !hasWinner {
            let alert = UIAlertController(title: "Winner", message: "Ничья\n\n Restart Game?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: {UIActionHandler in self.clearBoard()}))
            present(alert, animated: true)
        }
        
    }
    
    func clearBoard() {
        hasWinner = false
        player = 1
        for i in 0...8 {
            arrayBoard[i] = 0
            let button = view.viewWithTag(i+1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
        }
    }
    
}

