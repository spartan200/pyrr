//
//  CFTSegmentBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-05-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import SQLite

class CFTSegmentBroker: CFTRelationalBroker
{

    // MARK: Create Table Function
    
    override func createTable() -> Bool {
        let segment = Table("segment")
        
        let segmentId = Expression<Int64>("segment_id")
        let createdAt = Expression<Date?>("created_at")
        let updatedAt = Expression<Date?>("updated_at")
        let totalElevationGain = Expression<Double?>("total_elevation_gain")
        // TODO: Map
        let effortCount = Expression<Int?>("effort_count")
        let athleteCount = Expression<Int?>("athlete_count")
        let starCount = Expression<Int?>("star_count")
        
        return createTable(sqlStmt: segment.create { t in
            let segmentSummary = Table("segment_summary")
            t.column(segmentId, primaryKey: true)
            t.column(createdAt)
            t.column(updatedAt)
            t.column(totalElevationGain)
            t.column(effortCount)
            t.column(athleteCount)
            t.column(starCount)

            let id = Expression<Int64>("segment_summary_id")
            t.foreignKey(segmentId, references: segmentSummary, id, update: .cascade)
        })
    }

    // MARK: Non Query Functions
    /// - Function inserts the array of segments into the database
    func insertRecords(segments: [Segment]) -> Bool {
        let db  = try! Connection(getPath())

        for segment in segments {
            // Insert into the summary table first
            _ = CFTSegmentSummaryBroker.upsertSegmentSummary(segmentSummary: segment, db: db)
            
            _ = CFTSegmentBroker.upsertSegment(segment: segment, db: db)
        }
        
        return true
    }
    
    /// - Function upserts a record into the segment table.  Returns true/false
    ///   depending on if it was successful.
    static func upsertSegment(segment: Segment, db: Connection) {
        let prevChanges = db.totalChanges
        let updateQuery = "UPDATE segment SET created_at = ?, updated_at = ?, total_elevation_gain = ?, " +
                                             "effort_count = ?, athlete_count = ?, star_count = ? " +
                          "WHERE segment_id = ?"
        let stmt = try! db.prepare(updateQuery)
        
        var params: [Binding?] = segment.toUpdateSegmentParams()
        
        // Execute the statement
        try! stmt.run(params)
        
        if (db.changes - prevChanges) < 1 {
            // Nothing was updated so we need to do an insert
            let insertQuery = "INSERT INTO segment(segment_id, created_at, updated_at, total_elevation_gain, " +
                                                  "effort_count, athlete_count, star_count) " +
                              "VALUES(?, ?, ?, ?, ?, ?, ?)"
            let insertStmt = try! db.prepare(insertQuery)
            params = segment.toInsertSegmentParams()
            
            try! insertStmt.run(params)
        }
    }
}
