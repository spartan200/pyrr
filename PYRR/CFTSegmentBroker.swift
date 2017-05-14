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
        let createdAt = Expression<Date>("created_at")
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

}
