//
//  ActivityMeta.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class ActivityMeta {
    // The id for the activity
    var activityId: Int?;
    
    // The resource state for the activity
    var resourceState: Int?;
    
    /// - Initialize the object from the dictionary
    init (fromDict: [String: Any]) {
        self.activityId = fromDict["id"] as! Int?
        self.resourceState = fromDict["resource_state"] as! Int?
    }
}
