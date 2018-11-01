//
//  ViewController.swift
//  TableViewDemo2
//
//  Created by Alex Jintak Han on 2018-10-10.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

//datasource : look
//datadelegate : behave
class ContactsViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        // already label has a tag
        if let label = cell.viewWithTag(500) as? UILabel{
            label.text = "IOS Programming!"
        }
        
        
        return cell
        
    }
}

extension ContactsViewController{

}
