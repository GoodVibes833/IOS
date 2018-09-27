//
//  ViewController.swift
//  Cards
//
//  Created by Alex Jintak Han on 2018-09-27.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flipOutletCount: UILabel!
    var flipCount = 0{
        didSet{
            flipOutletCount.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    var emojis : [String] = ["🙉","🙉","🐱","🐱","🦊","🦊"]
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        // update flipCountLabel
        flipCount += 1
        
        if let cardNumber = cardButtons.firstIndex(of: sender){
            flipImage(withEmoji: emojis[cardNumber], on: sender)
        }else{
            print("card was not in the cardButtons collections")
        }
        }
    
    
    func flipImage(withEmoji emoji : String, on button:UIButton) {
        if button.currentTitle == emoji{
            button.setTitle("", for: .normal)
            button.backgroundColor = #colorLiteral(red: 0.9973708035, green: 1, blue: 0.5103720771, alpha: 1)
        }else{
            button.setTitle(emoji, for: .normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        
        }
        }
    }


