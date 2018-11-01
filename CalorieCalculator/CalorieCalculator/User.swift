//
//  User.swift
//  CalorieCalculator
//
//  Created by Alex Jintak Han on 2018-10-25.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import Foundation

class User {
    var name: String
    var height: Double
    var sex:Bool
    var currentWeight: Double
    var targerWeight: Double
    
    init(name: String, height:Double, sex:Bool, currentWeight:Double, targetWeight:Double) {
        self.name = name
        self.height = height
        self.sex = sex
        self.currentWeight = currentWeight
        self.targerWeight = targetWeight
    }
}




