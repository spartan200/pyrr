//
//  Activities.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class Activity: ActivitySummary {
    
    // Calories the Athlete burned doing the Activity.
    // Kilocalories, uses kilojoules for rides and speed/pace for runs.
    var calories: Float?;
    
    // The description of the Activity.
    var description: String?;
    
    // The gear that what used for the activity.
    var gear: GearSummary?;
    
    // The segmentEfforts for the activity.
    // Array of summary representations of the segment efforts, segment effort ids must
    // be represented as 64-bit datatypes.
    var segmentEfforts: Array<SegmentEffortSummary>?;
    
    // The SplitMetrics for the Activity.
    // Running activities only.
    var splitsMetric: Array<SplitSummary>?;
    
    // The Splits Standard for the Activity.
    // Running activities only.
    var splitsStandard: Array<SplitSummary>?;
    
    // The Laps completed for the Activity.
    var laps: Array<LapSummary>?;
    
    // The best efforts for the Activity.
    // Running activities only.
    var bestEfforts: Array<SegmentEffortSummary>?;
    
    // The device name used to record the Activity.
    var deviceName: String?;
    
    // The token used to embed a Strava activity in the form www.strava.com/activities/[activity_id]/embed/[embed_token]
    var embedToken: String?;
    
    // Photos that were taken for the activity.
    // Array of PhotoSummary objects.
    var photos: Array<PhotoSummary>?;
    
    /// - Intialize the Activity object from the given dictionary
    override init(fromDict: [String: Any]) {
        super.init(fromDict: fromDict)
        
        self.calories = fromDict["calories"] as! Float?
        self.description = fromDict["description"] as? String
        if (fromDict["segment_efforts"] != nil) {
            self.segmentEfforts = SegmentEffort.parseSegmentEfforts(fromDictArr: fromDict["segment_efforts"] as! [[String : Any]])
        }
    }
    
    /// - Function returns an array of activities from the parsed data.
    /// - If there is an issue with parsing the data the activity array will be Nil.
    static func parseActivities(rawActivities: Data) -> [Activity] {
        var activities = [Activity]()
        
        if let parsedData = try? JSONSerialization.jsonObject(with: rawActivities) as! [[String: Any]] {
            for actDict in parsedData {
                let activity = Activity(fromDict: actDict)
                activities.append(activity)
            }
        } else {
            // TODO: Need to handle when there is an error parsing the JSON
            NSLog("bad json - do some recovery")
        }
        
        return activities
    }
}
