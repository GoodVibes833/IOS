//
//  ViewController.swift
//  IphoneImages
//
//  Created by Alex Jintak Han on 2018-11-09.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var iphoneImageView : UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string : "http://imgur.com/zdwdenZ.png")!
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        (session.downloadTask(with: url) { (data, response, error) in
            if let error = error{
                print("Error : \(error.localizedDescription)")
                return
            }
            guard let data = data else{return}
            
            if let imageData = try? Data(contentsOf: data){
                OperationQueue.main.addOperation {
                    self.iphoneImageView.image = UIImage(data : imageData)
                }
                
            }
        
        }).resume()
        
    }


}

