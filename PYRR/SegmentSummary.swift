//
//  SegmentSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import SQLite

class SegmentSummary {
    // Unique Id of the Segment
    var segmentId: Int64?;
    
    // Resource state of the Segment
    var resourceState: Int?;
    
    // The name of the Segment
    var name: String?;
    
    // Activity Type for the Segment.
    // Values: 'Ride' or 'Run'.
    var activityType: ActivityType?;
    
    // Distance that is covered by the Segment.
    // Meters
    var distance: Double?;
    
    // Average grade during the Segment.
    // Percentage
    var averageGrade: Double?;
    
    // Maximum grade for the Segment
    // Percentage
    var maximumGrade: Double?;
    
    // Highest elevation of the Segment
    var elevationHigh: Double?;
    
    // Lowest elveation of the Segment
    var elevationLow: Double?;
    
    // Starting Latitude/Longitude of the Segment
    var startLatLng: StravaCoordinate?;
    
    // Ending Latitude/Longitude of the Segment
    var endLatLng: StravaCoordinate?;
    
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
    
    // True if this is a hazardous Segment
    var hazardous: Bool?;
    
    /// Function that initializes a Segment Summary object from a dictionary of
    /// Any values and String for the key
    init(fromDict: [String: Any]) {
        self.segmentId = fromDict["id"] as! Int64?
        self.resourceState = fromDict["resource_state"] as! Int?
        self.name = fromDict["name"] as! String?
        //self.activityType = fromDict["activity_type"] as! String?
        self.distance = fromDict["distance"] as! Double?
        self.averageGrade = fromDict["avg_grade"] as! Double?
        self.maximumGrade = fromDict["maximum_grade"] as! Double?
        self.elevationHigh = fromDict["elevation_high"] as! Double?
        self.elevationLow = fromDict["elevation_low"] as! Double?
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
        
        self.climbCategory = fromDict["climb_category"] as! Int?
        //self.climbCategoryDesc = fromDict["climb_category_desc"]
        self.city = fromDict["city"] as! String?
        self.state = fromDict["state"] as! String?
        self.country = fromDict["country"] as! String?
        self.privateSegment = fromDict["private"] as! Bool?
        self.starred = fromDict["starred"] as! Bool?
        self.hazardous = fromDict["hazardous"] as! Bool?
    }
    
    /// Function returns all the bindings for the SegmentSummary object for when the object is being updated.
    /// Assumes that the update statement is in order of the params in the function and the where clause uses the
    /// segment id.
    final func toUpdateSegmentSummaryParams() -> [Binding?] {
        var params = [Binding?]()
        
        params.append(self.resourceState)
        params.append(self.name)
        if (self.distance == nil) {
            params.append(nil)
        } else {
            params.append((self.distance as! Binding))
        }
        if (self.averageGrade == nil) {
            params.append(nil)
        } else {
            params.append((self.averageGrade as! Binding))
        }
        if (self.maximumGrade == nil) {
            params.append(nil)
        } else {
            params.append((self.maximumGrade as! Binding))
        }
        if (self.elevationHigh == nil) {
            params.append(nil)
        } else {
            params.append((self.elevationLow as! Binding))
        }
        if (self.elevationHigh == nil) {
            params.append(nil)
        } else {
            params.append((self.elevationHigh as! Binding))
        }
        if (self.startLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.startLatLng!.latitude as Binding))
        }
        if (self.startLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.startLatLng!.longitude as Binding))
        }
        if (self.endLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.endLatLng!.latitude as Binding))
        }
        if (self.endLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.endLatLng!.longitude as Binding))
        }
        if (self.climbCategory == nil) {
            params.append(nil)
        } else {
            params.append((self.climbCategory as! Binding))
        }
        params.append(self.city)
        params.append(self.state)
        params.append(self.country)
        if (self.privateSegment == nil) {
            params.append(nil)
        } else {
            params.append(self.privateSegment)
        }
        if (self.starred == nil) {
            params.append(nil)
        } else {
            params.append(self.starred)
        }
        if (self.hazardous == nil) {
            params.append(nil)
        } else {
            params.append(self.hazardous)
        }
        params.append(self.segmentId)
        
        return params
    }
    
    /// Function returns the list of bindings for the insert statement.
    /// Assumes all the fields are being inserted
    final func toInsertSegmentSummaryParams() -> [Binding?] {
        var params = [Binding?]()
        
        params.append(self.segmentId)
        params.append(self.resourceState)
        params.append(self.name)
        if (self.distance == nil) {
            params.append(self.distance)
        } else {
            params.append((self.distance as! Binding))
        }
        if (self.averageGrade == nil) {
            params.append(self.averageGrade)
        } else {
            params.append((self.averageGrade as! Binding))
        }
        if (self.maximumGrade == nil) {
            params.append(nil)
        } else {
            params.append((self.maximumGrade as! Binding))
        }
        if (self.elevationHigh == nil) {
            params.append(nil)
        } else {
            params.append((self.elevationHigh as! Binding))
        }
        if (self.elevationLow == nil) {
            params.append(nil)
        } else {
            params.append((self.elevationLow as! Binding))
        }
        if (self.startLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.startLatLng!.latitude as Binding))
        }
        if (self.startLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.startLatLng!.longitude as Binding))
        }
        if (self.endLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.endLatLng!.latitude as Binding))
        }
        if (self.endLatLng == nil) {
            params.append(nil)
        } else {
            params.append((self.endLatLng!.longitude as Binding))
        }
        if (self.climbCategory == nil) {
            params.append(nil)
        } else {
            params.append((self.climbCategory as! Binding))
        }
        params.append(self.city)
        params.append(self.state)
        params.append(self.country)
        if (self.privateSegment == nil) {
            params.append(nil)
        } else {
            params.append(self.privateSegment)
        }
        if (self.starred == nil) {
            params.append(nil)
        } else {
            params.append(self.starred)
        }
        if (self.hazardous == nil) {
            params.append(nil)
        } else {
            params.append(self.hazardous)
        }
        
        return params
    }
}
