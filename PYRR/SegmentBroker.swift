//
//  SegmentBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-01.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class SegmentBroker : StravaBroker
{
    // Contains the segments that have been returned
    var _segmentsArr: [Segment]?
    
    // Contains the number of recursive calls that have been made
    // so we know when to return
    var _recursiveCalls = -1
    
    /// - Function starts getting a list of all the segments in the given box.
    func startGetSegments(southWest: StravaCoordinate, northEast: StravaCoordinate,
                          activityType: ActivityType) {
        var params = [String: AnyObject]();
        params["bounds"] = String(southWest.latitude) + "," + String(southWest.longitude) + "," +
                           String(northEast.latitude) + "," + String(northEast.longitude) as AnyObject?
        
        if (_segmentsArr == nil) {
            _segmentsArr = [Segment]()
        }
        
        makeHTTPGetRequest(requestName: "segments/explore", parameters: params, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error and return
            }
            
            if (self._recursiveCalls != -1) {
                // Decrement the number of recursive calls
                self._recursiveCalls -= 1;
            }
            
            let segmentArr = Segment.parseSegments(rawSegments: data!);
            
            if (segmentArr == nil) {
                // TODO: There was an error parsing the segments so return
            } else if (segmentArr!.count < 10) {
                // This is the base case so we need to add the list of segments
                self._segmentsArr! += segmentArr!
                
                if (self._recursiveCalls == 0) {
                    // We are all finished to alert the calling class that we are done
                    NSLog("Finished")
                }
            } else {
                // Add 4 to keep track of the number of recursive calls we are making
                if (self._recursiveCalls == -1) {
                    self._recursiveCalls = 4
                } else {
                    self._recursiveCalls += 4
                }
                
                // Need to split the box into 4 different areas and make a recursive call
                let halfLat = (southWest.latitude - northEast.latitude) / 2.0 + northEast.latitude
                let halfLong = (southWest.longitude - northEast.longitude) / 2.0 + northEast.longitude
                
                // Make the recursive calls
                // North West
                self.startGetSegments(southWest: StravaCoordinate(latitude: halfLat, longitude: southWest.longitude),
                                      northEast: StravaCoordinate(latitude: northEast.latitude, longitude: halfLong),
                                      activityType: activityType)
                // North East
                self.startGetSegments(southWest: StravaCoordinate(latitude: halfLat, longitude: halfLong),
                                      northEast: northEast, activityType: activityType)
                
                // South West
                self.startGetSegments(southWest: southWest,
                                      northEast: StravaCoordinate(latitude: halfLat, longitude: halfLong),
                                      activityType: activityType)
                
                // South East
                self.startGetSegments(southWest: StravaCoordinate(latitude: southWest.latitude, longitude: halfLong),
                                      northEast: StravaCoordinate(latitude: halfLat, longitude: northEast.longitude),
                                      activityType: activityType);
            }
        })
    }
}
