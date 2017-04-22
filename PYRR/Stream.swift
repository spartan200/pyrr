//
//  Stream.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-22.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class Stream {
    // The Stream Type time, latlng, distance, etc..
    // TODO: Probably need to make this a enum
    var type: String?
    
    // Array of stream values.
    // Will only be Latitude and longitude values now
    var latLngData: [StravaCoordinate]?
    
    // Series type used for down sampling, will be present even if not used
    var seriesType: String?
    
    // Complete stream length
    var originalSize: Int?
    
    // Resolution, 'low', 'medium', or 'high'
    var resolution: String?
    
    /// - Initialize the Stream object from the given dictionary
    init(fromDict: [String: Any]) {
        type = fromDict["type"] as? String
        let dataDict = fromDict["data"] as? [[Double]]
        if (dataDict != nil) {
            latLngData = [StravaCoordinate]()
            for coord in dataDict! {
                self.latLngData!.append(StravaCoordinate(latitude: coord[0], longitude: coord[1]))
            }
        }
        seriesType = fromDict["series_type"] as? String
        originalSize = fromDict["original_size"] as? Int
        resolution = fromDict["resolution"] as? String
    }
}
