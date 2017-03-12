//
//  PYRRTests.swift
//  PYRRTests
//
//  Created by Collin Thommasen on 2017-02-26.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import XCTest
@testable import PYRR

class PYRRTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testStrava() {
        _ = self.expectation(description: "longRunningFunction");
        
        let stravaBroker = StravaBroker();
        
        stravaBroker.StravaBrokerTest();
        
        self.waitForExpectations(timeout: 5, handler: { error in
        });
    }
    
}
