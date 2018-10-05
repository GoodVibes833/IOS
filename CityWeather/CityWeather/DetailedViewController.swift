//
//  DetailedViewController.swift
//  CityWeather
//
//  Created by Alex Jintak Han on 2018-10-04.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController {

    var city : City!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        let cityLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 300, width: 200, height: 50))
        
        cityLabel.text = city.name
        cityLabel.textAlignment = .center
        cityLabel.font = UIFont(name: "Helvetica Neue", size: 40)
        view.addSubview(cityLabel)
        
        let tempLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 200, width: 200, height: 50))
        
        tempLabel.text = "Temperature : \(String(city.temp))"
        tempLabel.textAlignment = .center
        tempLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        view.addSubview(tempLabel)
        
    
        
        let precipitationLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 - 100, width: 200, height: 50))
        
        precipitationLabel.text = "precipitation : \(String(city.precipitation))"
        precipitationLabel.textAlignment = .center
        precipitationLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        view.addSubview(precipitationLabel)
        
        let summaryLabel = UILabel(frame: CGRect(x: view.bounds.width / 2 - 100, y: view.bounds.height / 2 , width: 200, height: 50))
        
        summaryLabel.text = "Summary : \(city.summary)"
        summaryLabel.textAlignment = .center
        summaryLabel.font = UIFont(name: "Helvetica Neue", size: 20)
        view.addSubview(summaryLabel)
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
