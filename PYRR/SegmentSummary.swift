//
//  SegmentSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class SegmentSummary {
    // Unique Id of the Segment
    var segmentId: Int?;
    
    // Resource state of the Segment
    var resourceState: Int?;
    
    // The name of the Segment
    var name: String?;
    
    // Activity Type for the Segment.
    // Values: 'Ride' or 'Run'.
    // TODO: Should be an enum.
    var activityType: String?;
    
    // Distance that is covered by the Segment.
    // Meters
    var distance: Float?;
    
    // Average grade during the Segment.
    // Percentage
    var averageGrade: Float?;
    
    // Maximum grade for the Segment
    // Percentage
    var maximumGrade: Float?;
    
    // Highest elevation of the Segment
    var elevationHigh: Float?;
    
    // Lowest elveation of the Segment
    var elevationLow: Float?;
    
    // Starting Latitude/Longitude of the Segment
    // TODO Should be Lat/Lng Struct
    var startLatLng: String?;
    
    // Ending Latitude/Longitude of the Segment
    // TODO: Should be Lat/Lng Struct
    var endLatLng: String?;
    
    // The climb category for the Segment.
    // ie: 5 is Hors categories, 0 is uncategorized.
    // TODO: Should be an enum
    var climbCategory: Int?;
    
    // City the Segment is in.
    var city: String?;
    
    // State the Segment is in.
    var state: String?;
    
    // Country the Segment is in.
    var country: String?;
    
    // True/False depending on if the segment is private.
    // Note: Actual value is private
    var privateSegment: Bool?;
    
    // True if authenticated Athlete has starred the Segment
    var starred: Bool?;
    
    // True if this is a hazardoues Segment
    var hazardoues: Bool?;
}
