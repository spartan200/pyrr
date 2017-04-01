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
    /// - Function starts getting a list of all the segments in the given box.
    func startGetSegments(southWest: StravaCoordinate, northEast: StravaCoordinate,
                          activityType: ActivityType) {
        var params = [String: AnyObject]();
        params["bounds"] = String(southWest.latitude) + "," + String(southWest.longitude) + "," +
                           String(northEast.latitude) + "," + String(northEast.longitude) as AnyObject?
        
        makeHTTPGetRequest(requestName: "segments/explore", parameters: params, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error and return
            }
            
            let segmentArr = Segment.parseSegments(rawSegments: data!);
            
            if (segmentArr == nil) {
                // TODO: There was an error parsing the segments so return
            }
        })
    }
}
