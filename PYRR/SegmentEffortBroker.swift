//
//  SegmentEffortBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-22.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/// - Type of function that gets called when a get single record finishes
typealias SingleSegmentEffortResponse = (SegmentEffort) -> Void

class SegmentEffortBroker : StravaBroker {
    
    /// - Function returns the segment effort with the given segment effort id
    func getRecord(segmentEffortId: Int64, onCompletion: @escaping SingleSegmentEffortResponse) {
        makeHTTPGetRequest(requestName: "segment_efforts/\(segmentEffortId)", parameters: nil, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error case
            }
            
            if let parsedData = try? JSONSerialization.jsonObject(with: data!) as! [String: Any] {
                let segmentEffort = SegmentEffort(fromDict: parsedData)
                onCompletion(segmentEffort)
            } else {
                // TODO: Need to handle when there is an error parsing the JSON
                NSLog("bad json - do some recovery")
            }
        })
    }
}
