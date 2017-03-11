//
//  Segment.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class Segment: SegmentSummary {
    // Date time the Segment was created.
    var createdAt: Date?;
    
    // Date time the Segment was last updated.
    var updatedAt: Date?;
    
    // Total elevation that is gained during the Segment.
    // Meters
    var totalElevationGain: Float?;
    
    // Map object for the Segment.
    // Inlcudes a summary polyline.
    var map: Map?;
    
    // Number of attempts for the Segment.
    var efforCount: Int?;
    
    // Number of unique Athletes that have attempted the segment.
    var athleteCount: Int?;
    
    // The number of Stars on this segment.
    var starCount: Int?;
}
