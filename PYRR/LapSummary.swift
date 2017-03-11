//
//  LapSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class LapSummary {
    // Unique Key for the Lap Summary
    var lapSummaryId: Int?;
    
    // Resource State for the Lap Summary
    var resourceState: Int?;
    
    // The name of the Lap
    var name: String?;
    
    // Activity the Lap Summary belongs too
    var activity: ActivityMeta?;
    
    // Athlete that performed the Lap Summary
    var athlete: AthleteMeta?;
    
    // Average cadence during the Lap.
    // RPM, bike only
    var averageCadence: Float?;
    
    // Average speed during the Lap.
    // m/s
    var averageSpeed: Float?;
    
    // Distance travelled during the Lap.
    // meters
    var distance: Float?;
    
    // Elapsed time for the lap
    // seconds
    var elapsedTime: Float?;
    
    // Start index of the Lap
    var startIndex: Int?;
    
    // End index of the Lap
    var endIndex: Int?;
    
    // Lap Index
    var lapIndex: Int?;
    
    // Maximum speed achieved during the Lap.
    // m/s
    var maxSpeed: Float?;
    
    // Time the Athlete was moving during the Lap.
    // seconds
    var movingTime: Int?
    
    // Pace Zone for the Lap
    var paceZone: Int?;
    
    // Split number for the Lap
    var split: Int?;
    
    // Start Date Time of the Lap, in UTC
    var StartDate: Date?;
    
    // Start Date Time of the Lap in the Local Time zone
    var StartDateLocal: Date?;
    
    // Total elevation that was gained during the Lap
    // meters
    var totalElevationGain: Float?;
}
