//
//  converterTests.swift
//  NumeroTests
//
//  Created by Alex Jintak Han on 2018-10-25.
//  Copyright © 2018 Facebook. All rights reserved.
//

import XCTest
@testable import Numero

class converterTests: XCTestCase {
    
    let converter = Converter()
    
    func testConverstionForOne(){
//        1 -> I
        let result = converter.convert(1)
        XCTAssertEqual(result, "I","Conversion for 1 is incorrect")
    }
    
    func testConverstionForTwo(){
        //        2 -> II
        let result = converter.convert(2)
        XCTAssertEqual(result, "II","Conversion for 2 is incorrect")
    }
    
    func testConverstionForFive(){
        //        5 -> V
        let result = converter.convert(5)
        XCTAssertEqual(result, "V","Conversion for 5 is incorrect")
    }
    
    func testConverstionForSix(){
        //        6 -> VI
        let result = converter.convert(6)
        XCTAssertEqual(result, "VI","Conversion for 6 is incorrect")
    }
    
    func testConverstionForTen(){
        //        6 -> VI
        let result = converter.convert(10)
        XCTAssertEqual(result, "X","Conversion for 10 is incorrect")
    }

    func testConverstionForTwenty(){
        //        6 -> VI
        let result = converter.convert(20)
        XCTAssertEqual(result, "XX","Conversion for 20 is incorrect")
    }
    
    func testConverstionForFour(){
        //        6 -> VI
        let result = converter.convert(4)
        XCTAssertEqual(result, "IV","Conversion for 4 is incorrect")
    }
   
    func testConverstionForNine(){
        //        6 -> VI
        let result = converter.convert(9)
        XCTAssertEqual(result, "IX","Conversion for 9 is incorrect")
    }
    
    func testConverstionForZero(){
        //        6 -> VI
        let result = converter.convert(0)
        XCTAssertEqual(result, "","Conversion for 0 is incorrect")
    }
    
    func testConverstionFor3999(){
        //        6 -> VI
        let result = converter.convert(3999)
        XCTAssertEqual(result, "MMMCMXCIX","Conversion for 3999 is incorrect")
    }
    
}
