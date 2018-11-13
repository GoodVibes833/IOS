//
//  ViewController.swift
//  cocoaPods-Test
//
//  Created by Alex Jintak Han on 2018-11-13.
//  Copyright © 2018 AlexHan. All rights reserved.
//

import UIKit
import ScrollableGraphView

class ViewController: UIViewController, ScrollableGraphViewDataSource {
    let linePlotData : [Double] = [10.0, 70.0, 23.5, 60.3, 56.4,10.0, 70.0, 23.5, 60.3, 56.4
    ]
        func value(forPlot plot: Plot, atIndex pointIndex: Int) -> Double {
        // Return the data for each plot.
        switch(plot.identifier) { 
        case "line":
            return linePlotData[pointIndex]
        default:
            return 0
        }
    }
    
    func label(atIndex pointIndex: Int) -> String {
        return "FEB \(pointIndex + 1) "
    }
    
    func numberOfPoints() -> Int {
        return linePlotData.count
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let frameWidth = view.frame.width

        let graphView = ScrollableGraphView(frame: view.frame, dataSource: self)
        
        let linePlot = LinePlot(identifier: "line")
        
        let referenceLines = ReferenceLines()
        
        graphView.addPlot(plot: linePlot)
        graphView.addReferenceLines(referenceLines: referenceLines)
        
        view.addSubview(graphView)
    }


}

