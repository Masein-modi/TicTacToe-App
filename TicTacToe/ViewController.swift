//
//  ViewController.swift
//  TicTacToe
//
//  Created by Masein Mody on 4/8/18.
//  Copyright © 2018 Masein Mody. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var player = 1  // 1 is nought and 2 is cross
    var gameState = [0,0,0,0,0,0,0,0,0]
    let winState = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func buttonPressed(_ sender: Any) {
        
        if gameState[(sender as AnyObject).tag - 1] == 0{

            if player == 1 {
                gameState[(sender as AnyObject).tag - 1] = 1
                (sender as AnyObject).setImage(#imageLiteral(resourceName: "cross"), for: [])
                player = 2
            }else {
                gameState[(sender as AnyObject).tag - 1] = 2
                (sender as AnyObject).setImage(#imageLiteral(resourceName: "nought"), for: [])
                player = 1
            }
        }
        
        for winstate in winState{
            if gameState[winstate[0]] != 0
                && gameState[winstate[0]] == gameState[winstate[1]]
                && gameState[winstate[1]] == gameState[winstate[2]]{
                
                var tempButton : UIButton
                for i in 1..<10{
                    tempButton = view.viewWithTag(i) as! UIButton
                    tempButton.alpha = 0.5
                    tempButton.isEnabled = false
                }
                playAgainButton.isHidden = false
                UIView.animate(withDuration: 1, animations: {
                    self.playAgainButton.center = CGPoint(x: self.playAgainButton.center.x + 500, y: self.playAgainButton.center.y+100)
                })
            }
        }
      
    }
    

    @IBAction func toPlayAgain(_ sender: Any) {
        var tempButton : UIButton
        for i in 1..<10{
            tempButton = view.viewWithTag(i) as! UIButton
            tempButton.setImage(nil, for: [])
            tempButton.isEnabled = true
            tempButton.alpha = 1
            gameState[i-1] = 0
        }
        playAgainButton.isHidden = true
    }
    
    
      override func viewDidLoad() {
        super.viewDidLoad()
        playAgainButton.center = CGPoint(x: playAgainButton.center.x - 500, y: playAgainButton.center.y)
        playAgainButton.isHidden = true
    }


}

