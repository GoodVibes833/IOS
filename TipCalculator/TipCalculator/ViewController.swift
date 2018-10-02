//
//  ViewController.swift
//  TipCalculator
//
//  Created by Alex Jintak Han on 2018-10-02.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

//viewcontroller is delegate

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var MoneyToPayPerAPerson: UILabel!
    
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipPercentage: UITextField!
    @IBOutlet weak var numOfPeople: UITextField!
    
    @IBAction func CalculateButtonClicked(_ sender: Any) {
        let billAmount2Int: Int? = Int(billAmount.text!)
        let tipPercentage2Int: Int? = Int(tipPercentage.text!)
        let numOfPeople2Int: Int? = Int(numOfPeople.text!)

        let result = billAmount2Int! * (tipPercentage2Int! + 100) / (numOfPeople2Int! * 100)
        
        MoneyToPayPerAPerson.text = String(result)
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        billAmount.delegate = self //viewController
        tipPercentage.delegate = self
        numOfPeople.delegate = self
        
    
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        // hey center, listen to this method
        NotificationCenter.default.addObserver(self, selector : #selector(keyboardwillShow), name : ViewController.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector : #selector(keyboardwillHide), name : ViewController.keyboardWillHideNotification, object: nil)
        
    }
    
    @objc func keyboardwillHide(notification: NSNotification){
        if let keyboardFrame : NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if view.frame.origin.y != 0{
                view.frame.origin.y += keyboardHeight
            }
        }
    }
    
    @objc func keyboardwillShow(notification: NSNotification){
        if let keyboardFrame : NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            if view.frame.origin.y == 0{
                view.frame.origin.y -= keyboardHeight
            }
        }
    }
    
    // keyboard go away when we enter Return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // keyboard go away when we enter Return
        textField.resignFirstResponder()
        return true
    }
    // keyboard go away when we click somewhere

    
    
    @objc func dismissKeyboard(_ sender : UITapGestureRecognizer){
        billAmount.resignFirstResponder()
        tipPercentage.resignFirstResponder()
        numOfPeople.resignFirstResponder()
    }


}

