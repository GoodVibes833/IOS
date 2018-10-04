//
//  ViewController.swift
//  PassingData
//
//  Created by Alex Jintak Han on 2018-10-04.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // click the segue(link) and type first in identifier
        if segue.identifier == "first"{
            //needs to downCasting
            if let secondVC = segue.destination as? SecondViewController{
                secondVC.data = nameTextField.text
            }
        }
    }


}

