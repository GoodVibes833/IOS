//
//  shuffleTests.swift
//  NumeroTests
//
//  Created by Alex Jintak Han on 2018-10-25.
//  Copyright © 2018 Facebook. All rights reserved.
//

import XCTest
@testable import Numero

class shuffleTests: XCTestCase {

    func testShuffleString() {
        let testString = "hello"
        let result = testString.garbled()
        XCTAssertNotEqual(testString, result, "hello is not garbled")
        
    }
    
    func testShuffleEmpty() {
        let testString = ""
        let result = testString.garbled()
        XCTAssertEqual(testString, result, "hello is not garbled")
        
    }
    
    func testShuffledStringWithoutSpaces() {
        let testString = "asd asd "
        let result = testString.garbled()
        XCTAssertNotEqual(testString, result, "empty is not garbled")
        
    }

}
