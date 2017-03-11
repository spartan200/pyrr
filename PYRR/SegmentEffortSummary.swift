//
//  SegmentEffortSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class SegmentEffortSummary {
    
    // Id of the segment effort summary
    var segmentEffortId: Int?;
    
    // Resource state of the segment effort
    var resourceState: Int?;
    
    // Name of the Segement Effort
    var name: String?;
    
    // Actitity that the Segment Effort belongs too.
    // Simple {id: NUM}
    var activity: Int?;
    
    // Athlete that performed the Segment Effort.
    // Simple {id: NUM}
    var athlete: Int?;
    
    // Time that elapsed while performing the Segment Effort.
    // Seconds
    var elapsedTime: Int?;
    
    // Time the Athlete was moving while performing the Segment Effort.
    // Seconds
    var movingTime: Int?;
    
    // Start Date Time of the Segment Effort, in UTC
    var startDate: Date?;
    
    // Start Date Time Local of the Segment Effort
    var startDateLocal: Date?;
    
    // The length of the effort as described by the activity, this may be different
    // than the length of the segment
    // Meters
    var distance: Float?;
    
    // The activity stream index of the start of this effort
    var startIndex: Int?;
    
    // The activity stream index of the end of this effort
    var endIndex: Int?;
    
    // The average cadence during the Segment effort
    // RPM, missing if not provided
    var averageCadence: Float?;
    
    // Average Watts produced during the Segment effort.
    // Rides only
    var averageWattts: Float?;
    
    // Device was used to measure the watts.
    // Rides only
    var deviceWatts: Float?;
    
    // Average heart rate of the Athlete while performing the Segment Effort
    // BPM, missing if not provided
    var averageHeartRate: Float?;
    
    // The maximum heart rate of the Athlete while performing the Segment Effort.
    // BPM, missing if not provided
    var maxHeartRate: Float?;
    
    // Representation of the covered Segment
    var segment: Segment?;
    
    // King of the Mountain rank for the segment.
    // 1-10 rank oin segment at time of upload
    var komRank: Int?;
    
    // Personal Record rank for the segment.
    // 1-3 personal record on segment at time of upload.
    var prRank: Int?;
    
    // Indicates a hidden/non-important effort when returned as part of an activity,
    // value may change over time, see retrieve an activity for more details.
    var hidden: Bool?;
}
