//
//  SplitSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class SplitSummary {
    // Average speed of the split
    // m/s
    var averageSpeed: Float?;
    
    // Distance travelled during the split.
    // meters
    var distance: Float?;
    
    // Time elapsed for the split
    // seconds
    var elapsedTime: Int?;
    
    // Elevation change for the split.
    // meters
    var elevationDistance: Float?;
    
    // The time the Athlete was moving during the Split
    // seconds
    var movingTime: Int?;
    
    // Pace zone for the split
    var paceZone: Int?;
    
    // The split number
    var split: Int?;
}
