//
//  CFTSegmentBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-05-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import SQLite

class CFTSegmentSummaryBroker: CFTRelationalBroker
{
    /// - Function to create the segment table
    override func createTable() -> Bool {
        let segmentSummary = Table("segment_summary")
        
        let segmentId = Expression<Int64>("id")
        let resourceId = Expression<Int64>("resource_id")
        let name = Expression<String>("name")
        // TODO: ActivityType
        let distance = Expression<Double>("distance")
        let averageGrade = Expression<Double?>("average_grade")
        let maximumGrade = Expression<Double?>("maximum_grade")
        let elevationHigh = Expression<Double?>("elevation_high")
        let elevationLow = Expression<Double?>("elevation_low")
        let startLat = Expression<Double>("start_latitude")
        let startLong = Expression<Double>("start_longitude")
        let endLat = Expression<Double>("end_latitude")
        let endLong = Expression<Double>("end_longitude")
        let climbCategory = Expression<Int?>("climb_category")
        let city = Expression<String?>("city")
        let state = Expression<String?>("state")
        let country = Expression<String?>("country")
        let privateSegment = Expression<Bool>("private_segment")
        let starred = Expression<Bool>("starred")
        let hazardoues = Expression<Bool>("hazardoues")
        
        return createTable(sqlStmt: segmentSummary.create { t in
            t.column(segmentId, primaryKey: true)
            t.column(resourceId)
            t.column(name)
            t.column(distance)
            t.column(averageGrade)
            t.column(maximumGrade)
            t.column(elevationHigh)
            t.column(elevationLow)
            t.column(startLat)
            t.column(startLong)
            t.column(endLat)
            t.column(endLong)
            t.column(climbCategory)
            t.column(city)
            t.column(state)
            t.column(country)
            t.column(privateSegment)
            t.column(starred)
            t.column(hazardoues)
        })
    }
    
    // MARK: Select Functions
    
    
    // MARK: Non Query Functions
    
    /// - Function inserts the array of segments into the database
    func insertRecords(segments: [Segment]) -> Bool {
        
        return false
    }
}
