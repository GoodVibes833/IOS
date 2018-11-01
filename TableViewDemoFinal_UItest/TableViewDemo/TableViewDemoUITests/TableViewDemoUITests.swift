//
//  TableViewDemoUITests.swift
//  TableViewDemoUITests
//
//  Created by Alex Jintak Han on 2018-10-30.
//  Copyright © 2018 Derrick Park. All rights reserved.
//

import XCTest

class TableViewDemoUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        
        // check the nav title
        // tableviewCell and tap
        // check the  nav title
    

        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Marcelo"]/*[[".cells.staticTexts[\"Marcelo\"]",".staticTexts[\"Marcelo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.navigationBars["Detail"].buttons["Back"].tap()
        app.navigationBars["TableViewDemo.View"].buttons["Organize"].tap()
        app.collectionViews.cells.otherElements.containing(.staticText, identifier:"Minami").element.tap()

    
        
    }

    func testGiada() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.staticTexts["Giada"]/*[[".cells.staticTexts[\"Giada\"]",".staticTexts[\"Giada\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
     
        
    }
}
