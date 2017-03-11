//
//  AthleteSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class AthleteSummary: AthleteMeta {
    // First name of the athlete
    var firstName: String?;
    
    // Last name of the athlete
    var lastName: String?;
    
    // Profile picture for the athlete.  URL to a 62x62 pixel profile picture.
    var profileMedium: String?;
    
    // Profile picture for the athlete.  URL to a 124x124 pixel profile picture.
    var profile: String?;
    
    // The city the athlete lives in.
    var city: String?;
    
    // The state the athlete lives in.
    var state: String?;
    
    // The country the athlete lives in.
    var country: String?;
    
    // The sex of the athlete. 
    // Values: 'M', 'F' or null
    // TODO: Should be enum
    var sex: String?;
    
    // The authenticated athlete's following status of this athlete.
    // Values: 'pending', 'accepted', 'blocked' or 'null'.
    // TODO: Should be enum
    var friend: String?;
    
    // The athlete's following status of the authenticated athlete.
    // Values: 'pending', 'accepted', 'blocked' or 'null'.
    // TODO: Should be enum
    var follower: String?;
    
    // Boolean value for whether or not the athlete has a premium account.
    var premium = false;
    
    // The time the athlete was created at.
    var createdAt: Date?;
    
    // The last time the athlete was updated at.
    var updatedAt: Date?;
}
