//
//  SegmentEffort.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class SegmentEffort: SegmentEffortSummary {
    
    /// - Initializes the Segment Effort from the given dictionary
    override init(fromDict: [String : Any]) {
        super.init(fromDict: fromDict)
    }
    
    /// - Function that converts the given array of dictionary objects into a
    ///   list of segment efforts.
    static func parseSegmentEfforts(fromDictArr: [[String: Any]]) -> [SegmentEffort] {
        var segmentEfforts = [SegmentEffort]()
        
        for segDict in fromDictArr {
            let seg = SegmentEffort(fromDict: segDict)
            segmentEfforts.append(seg)
        }
        
        return segmentEfforts
    }
}
