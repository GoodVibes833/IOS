//
//  SecondViewController.swift
//  PassingData
//
//  Created by Alex Jintak Han on 2018-10-04.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!
    var data : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = data

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
