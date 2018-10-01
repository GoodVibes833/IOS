//
//  ViewController.swift
//  BiggerTheBetter
//
//  Created by Alex Jintak Han on 2018-10-01.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var score: Int = 0
    
    
//    1. generate 2 rand num
    override func viewDidLoad() {
        //when all views are loaded to the memory.
        generateRandNumbers()
    }
    
    func generateRandNumbers() {
        let rand1 = arc4random_uniform(100) //0 ~ 99
        let rand2 = arc4random_uniform(100) //0 ~ 99
        
        leftButton.setTitle(String(rand1), for: .normal)
        rightButton.setTitle(String(rand2), for: .normal)
    }
    

    
//    2. set button action ( tab - increment score)
    @IBAction func leftButtonClicked(_ sender: UIButton) {
        //    3. check the answer
        checkAnswer(false)
        
        //    1. generate 2 rand num
        generateRandNumbers()

    }
    
    @IBAction func rightButtonClicked(_ sender: UIButton) {
        //    3. check the answer
        checkAnswer(true)
        
        //    1. generate 2 rand num
        generateRandNumbers()

    }
    
    //    3. check the answer
    func checkAnswer(_ rightBut: Bool) {
        // get the value from left and right
        if let leftNumber = leftButton.titleLabel?.text, let rightNumber = rightButton.titleLabel?.text{
            
        }

        // check if right is clicked{
        if rightBut{
            if (Int(leftNumber)! < Int(rightNumber)!){
                //correct
                score += 1
                
            }else{
                //wrong
                score -= 1
            }
        }else{
            if (Int(leftNumber)! > Int(rightNumber)!){
                //correct
                score += 1

            }else{
                //wrong
                score -= 1

            }
            
        }
        
        // update score and label
        scoreLabel.text = "Score : \(score)"
        
    }

}

