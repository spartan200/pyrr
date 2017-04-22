//
//  StreamBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-22.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/// - Type of function that gets called when the get records finishes
typealias StreamResponse = ([Stream]) -> Void

class StreamBroker : StravaBroker {
    
    /// - Function returns all the latitude and longitude stream efforts for the given
    ///   segment effort id.
    func getSegmentEffortStreams(segmentEffortId: Int64, onCompletion: @escaping StreamResponse) {
        makeHTTPGetRequest(requestName: "segment_efforts/\(segmentEffortId)/streams/latlng", parameters: nil, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error case
            }
            
            if let parsedData = try? JSONSerialization.jsonObject(with: data!) as! [[String: Any]] {
                var streams = [Stream]()
                
                for rawDict in parsedData {
                    streams.append(Stream(fromDict: rawDict))
                }

                onCompletion(streams)
            } else {
                // TODO: Need to handle when there is an error parsing the JSON
                NSLog("bad json - do some recovery")
            }
        })
    }
}
