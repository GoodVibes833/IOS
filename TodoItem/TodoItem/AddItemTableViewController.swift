//
//  AddItemTableViewController.swift
//  TodoItem
//
//  Created by Alex Jintak Han on 2018-10-11.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

protocol AddItemViewControllerDelegate:class {
    func addItemDidCancel()
    func addItemDidFinishAdding(_ item: TodoItem)
    func addItemDidFinishEditing(_ item: TodoItem)
}


class AddItemTableViewController: UITableViewController {
    @IBOutlet weak var textField: UITextField!

    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var cancelBarButton: UIBarButtonItem!
    
    weak var delegate: AddItemViewControllerDelegate?
    weak var itemToEdit: TodoItem?
    
    @IBAction func done(_ sender: UIBarButtonItem) {
        if let item = itemToEdit, let text = textField.text {
            item.text = text
            delegate?.addItemDidFinishEditing(item)
        }else{
            if let text = textField.text{
                let newItem = TodoItem()
                newItem.text = text
                newItem.checked = false

                delegate?.addItemDidFinishAdding(newItem)
            }
        }

    
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        delegate?.addItemDidCancel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        done by Stoty board
//        doneBarButton.isEnabled = false
//        textField.delegate = self
        
        //make the top navi bar removed
        navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit{
            title = "Edit Todo Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    // when cell cilcked, it is highlighted. -> disable
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
}

extension AddItemTableViewController:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
// TextField changed -> method called
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // unwrapping optionals
        // 1. if-let
        // 2. guard
        
//        if let text = textField.text{
//            print(text)
//        }
        
        guard let oldText = textField.text, let stringRange = Range(range, in:oldText) else{return false}
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
        doneBarButton.isEnabled = newText.isEmpty ? false : true
        
        return true
    }
}



