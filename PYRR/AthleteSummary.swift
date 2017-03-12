//
//  AthleteSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/**
 * Sex of the Athlete
 */
public enum Sex: String {
    case Male = "M"
    case Female = "F"
}

/**
 * Enum for the following status of the Athlete's friend
 */
public enum FollowingStatus: String {
    case Pending = "pending"
    case Accepted = "accepted"
    case Blocked = "blocked"
}
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
    var sex: Sex?;
    
    // The authenticated athlete's following status of this athlete.
    // Values: 'pending', 'accepted', 'blocked' or 'null'.
    var friend: FollowingStatus?;
    
    // The athlete's following status of the authenticated athlete.
    // Values: 'pending', 'accepted', 'blocked' or 'null'.
    var follower: FollowingStatus?;
    
    // Boolean value for whether or not the athlete has a premium account.
    var premium = false;
    
    // The time the athlete was created at.
    var createdAt: Date?;
    
    // The last time the athlete was updated at.
    var updatedAt: Date?;
}
