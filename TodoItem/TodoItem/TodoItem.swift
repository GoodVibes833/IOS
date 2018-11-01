//
//  TodoItem.swift
//  TodoItem
//
//  Created by Alex Jintak Han on 2018-10-11.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import Foundation

class TodoItem :NSObject {
    var text = ""
    var checked = false
    
    func toggleCheckmart() {
        self.checked = !self.checked
    }
}
