//
//  ActivityBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/// - Type of function that gets called when the get records finishes
typealias ActivityResponse = ([Activity]) -> Void

/// - Type of function that gets called when a get single record finishes
typealias SingleActivityResponse = (Activity) -> Void

class ActivityBroker: StravaBroker
{
    /// - Function returns all the acitivites for the current authenticated user.
    func getRecordsForAthlete(onCompletion: @escaping ActivityResponse) {
        makeHTTPGetRequest(requestName: "athlete/activities", parameters: nil, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error case
            }
            
            let activities = Activity.parseActivities(rawActivities: data!)
            
            onCompletion(activities)
        })
    }
    
    /// - Function returns the Activity object for the given activity id.  If
    ///   an object with the activityId doesn't exist then nil is returned.
    func getRecord(activityId: Int64, onCompletion: @escaping SingleActivityResponse) {
        makeHTTPGetRequest(requestName: "activities/\(activityId)", parameters: nil, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error case
            }
            
            if let parsedData = try? JSONSerialization.jsonObject(with: data!) as! [String: Any] {
                let activity = Activity(fromDict: parsedData)
                onCompletion(activity)
            } else {
                // TODO: Need to handle when there is an error parsing the JSON
                NSLog("bad json - do some recovery")
            }
        })
    }
}
