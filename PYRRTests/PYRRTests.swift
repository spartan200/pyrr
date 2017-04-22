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
    
    /*
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }*/
    
    func testStrava() {
        _ = self.expectation(description: "longRunningFunction");
        
        //let ne = StravaCoordinate(latitude: 49.172974, longitude: -123.996860);
        //let sw = StravaCoordinate(latitude: 49.146886, longitude: -124.013960);
        let ne = StravaCoordinate(latitude: 49.2, longitude: -123.9);
        let sw = StravaCoordinate(latitude: 49.15, longitude: -124.05);

        let segmentBroker = SegmentBroker()
        
        segmentBroker.startGetSegments(southWest: sw, northEast: ne, activityType: ActivityType.Ride)
        
        self.waitForExpectations(timeout: 60, handler: { error in
        });
    }
    
    /// - Function that tests the get activity function
    func testGetActivity() {
        _ = self.expectation(description: "longRunningFunction")
        
        // Activity from my list of activities
        let activityId = 935498796 as Int64
        
        let activityBroker = ActivityBroker()
        
        activityBroker.getRecord(activityId: activityId, onCompletion: {activity in
            NSLog("Stop")
        })
        
        self.waitForExpectations(timeout: 60, handler: { error in
        })
    }
    
    /// - Function that tests the get leaderboard function
    func testLeaderboard() {
        _ = self.expectation(description: "longRunningFunction");
        
        // Segment ID
        let segmentId = 9520362 as Int
        
        let leaderboardBroker = LeaderboardBroker()
        
        leaderboardBroker.getRecords(segmentId: segmentId, onCompletion: { leaderboard in
            NSLog("Stop")
        })
        
        self.waitForExpectations(timeout: 60, handler: { error in
        })
    }
    
    /// - Function that tests the get effort function
    func testSegmentEffort() {
        _ = self.expectation(description: "longRunningFunction")
        
        // Segment Effort ID
        let segmentEffortId = 22857193487 as Int64
        
        let segmentEffortBroker = SegmentEffortBroker()
        
        segmentEffortBroker.getRecord(segmentEffortId: segmentEffortId, onCompletion: { segmentEffort in
            NSLog("Stop")
        })
        
        self.waitForExpectations(timeout: 60, handler: { error in
        })
    }
    
    /// - Function that tests the get effort for a segment effort id
    func testStreamBroker() {
        _ = self.expectation(description: "longRunningFunction")
        
        // Segment Effort ID
        //let segmentEffortId = 22857193487 as Int64 - My effort
        let segmentEffortId = 9750127432 as Int64
        
        let streamBroker = StreamBroker()
        
        streamBroker.getSegmentEffortStreams(segmentEffortId: segmentEffortId, onCompletion: { streams in
            NSLog("Stop")
        })
        
        self.waitForExpectations(timeout: 60, handler: { error in })
    }
}
