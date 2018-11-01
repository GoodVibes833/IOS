//
//  DetailViewController.swift
//  TableViewDemo
//
//  Created by Derrick Park on 2018-10-09.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
	
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var studentName: UILabel! {
		didSet {
			studentName.text = nameString
		}
	}
	@IBOutlet weak var position: UILabel! {
		didSet {
			position.text = positionString
		}
	}
	@IBOutlet weak var biography: UITextView!
	
	var nameString: String!
	var positionString: String!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
    }

}
