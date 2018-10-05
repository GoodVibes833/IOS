//
//  ViewController.swift
//  CityWeather
//
//  Created by Alex Jintak Han on 2018-10-04.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    
    var city : City!
    var detailVC : DetailedViewController?
    
    @objc func showWeatherDetails() {
        detailVC = DetailedViewController()
        detailVC?.city = city
        navigationController?.pushViewController(detailVC!, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationController?.navigationBar.topItem?.title = city.name
        
        let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 150, width: 200, height: 50))
       
        cityLabel.text = city.name
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 40)
        view.addSubview(cityLabel)

        
        let butt = UIButton(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 25, width: 200, height: 50))
        butt.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        butt.setTitle("See details", for: .normal)
        butt.layer.cornerRadius = 10.0
        
        
        butt.addTarget(self, action: #selector(showWeatherDetails)
            , for: .touchUpInside)
        
        view.addSubview(butt)
        


    }
    

    


    
    func click(sender: UIButton) {
        print("click")
    }

}

