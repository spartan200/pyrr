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
    
    /// Function that initializes a Segment object from a dictionary of 
    /// Any values and String for the key
    init(fromDict: [String: Any]) {
        super.init()
        
        self.segmentId = fromDict["id"] as! Int?
        self.name = fromDict["name"] as! String?
        self.climbCategory = fromDict["climb_category"] as! Int?
        //self.climbCategoryDesc = fromDict["climb_category_desc"]
        self.averageGrade = fromDict["avg_grade"] as! Float?
        // Add the Start Lat/Lng
        var latLng = fromDict["start_latlng"] as! [Double]?
        if (latLng != nil) {
            self.startLatLng = StravaCoordinate(latitude: (latLng?[0])!, longitude: (latLng?[1])!)
        }
        
        // Add the End Lat/Lng
        latLng = fromDict["end_latlng"] as! [Double]?
        if (latLng != nil) {
            self.endLatLng = StravaCoordinate(latitude: (latLng?[0])!, longitude: (latLng?[1])!)
        }
        
        // TODO: Elevation Difference
        self.distance = fromDict["distance"] as! Float?
    }
    
    /// Function that parses the given data into a array of segments
    static func parseSegments(rawSegments: Data) -> [Segment]? {
        var segments = [Segment]();
        
        if let parsedData = try? JSONSerialization.jsonObject(with: rawSegments) as! [String:Any] {
            let rawSegments = parsedData["segments"] as! [[String: Any]]
            
            for segDict in rawSegments {
                let seg = Segment(fromDict: segDict)
                segments.append(seg)
            }
        } else {
            // TODO: Need to handle when there is an error parsing the JSON
            NSLog("bad json - do some recovery")
        }
        
        return segments
    }
}
