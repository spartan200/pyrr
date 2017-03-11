//
//  Activities.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class Activity {
    
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
}
