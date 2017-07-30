//
//  Segment.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import SQLite

class Segment: SegmentSummary {
    // Date time the Segment was created.
    var createdAt: Date?;
    
    // Date time the Segment was last updated.
    var updatedAt: Date?;
    
    // Total elevation that is gained during the Segment.
    // Meters
    var totalElevationGain: Double?;
    
    // Map object for the Segment.
    // Inlcudes a summary polyline.
    var map: Map?;
    
    // Number of attempts for the Segment.
    var effortCount: Int?;
    
    // Number of unique Athletes that have attempted the segment.
    var athleteCount: Int?;
    
    // The number of Stars on this segment.
    var starCount: Int?;
    
    /// Function that initializes a Segment object from a dictionary of 
    /// Any values and String for the key
    override init(fromDict: [String: Any]) {
        super.init(fromDict: fromDict)
        
        if (fromDict["created_at"] as? String != nil) {
            self.createdAt = Date(jsonDate: fromDict["created_at"] as! String)
        }
        
        if (fromDict["updated_at"] as? String != nil) {
            self.updatedAt = Date(jsonDate: fromDict["updated_at"] as! String)   
        }
        self.totalElevationGain = fromDict["total_elevation_gain"] as! Double?
        //TODO Need to handle the map
        //self.map =
        self.effortCount = fromDict["effort_count"] as! Int?
        self.athleteCount = fromDict["athlete_count"] as! Int?
        self.starCount = fromDict["star_count"] as! Int?
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
    
    /// Function returns the insert parameters for inserting into the segment table
    final func toInsertSegmentParams() -> [Binding?] {
        var params = [Binding?]()
        
        params.append(self.segmentId)
        if (self.createdAt == nil) {
            params.append(nil)
        } else {
            params.append((self.createdAt as! Binding))
        }
        if (self.updatedAt == nil) {
            params.append(nil)
        } else {
            params.append((self.updatedAt as! Binding))
        }
        if (self.totalElevationGain == nil) {
            params.append(nil)
        } else {
            params.append((self.totalElevationGain as! Binding))
        }
        if (self.effortCount == nil) {
            params.append(nil)
        } else {
            params.append((self.effortCount as! Binding))
        }
        if (self.athleteCount == nil) {
            params.append(nil)
        } else {
            params.append((self.athleteCount as! Binding))
        }
        if (self.starCount == nil) {
            params.append(nil)
        } else {
            params.append((self.starCount as! Binding))
        }
        
        return params
    }
    
    /// Function returns the update params for the segment table update segment
    final func toUpdateSegmentParams() -> [Binding?] {
        var params = [Binding?]()
        
        if (self.createdAt == nil) {
            params.append(nil)
        } else {
            params.append((self.createdAt as! Binding))
        }
        if (self.updatedAt == nil) {
            params.append(nil)
        } else {
            params.append((self.updatedAt as! Binding))
        }
        if (self.totalElevationGain == nil) {
            params.append(nil)
        } else {
            params.append((self.totalElevationGain as! Binding))
        }
        if (self.effortCount == nil) {
            params.append(nil)
        } else {
            params.append((self.effortCount as! Binding))
        }
        if (self.athleteCount == nil) {
            params.append(nil)
        } else {
            params.append((self.athleteCount as! Binding))
        }
        if (self.starCount == nil) {
            params.append(nil)
        } else {
            params.append((self.starCount as! Binding))
        }
        params.append(self.segmentId)
        
        return params
    }
}
