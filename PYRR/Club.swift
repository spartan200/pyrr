//
//  Club.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/**
 * Different Club Types
 */
public enum ClubType: String {
    case CasualClub = "casual_club"
    case RacingTeam = "racing_team"
    case Shop = "shop"
    case Company = "company"
    case Other = "other"
}

/**
 * Enum for the Club's membership status
 */
public enum MembershipStatus: String {
    case Member = "member"
    case Pending = "pending"
}

class Club: ClubSummary {
    // Description of the club
    var description: String?;
    
    // The type of club.
    // Values: 'casual_club', 'racing_team', 'shop', 'company', 'other'.
    var clubType: ClubType?;
    
    // The membership status of the requesting athlete.
    // Values: 'member', 'pending', null (not a member and have not requested to join).
    var membership: MembershipStatus?;
    
    // Whether or not the Athlete is a administrator for the club.
    // true only if the requesting athlete is a club admin.
    var admin: Bool?;
    
    // Whether or not the Athlete is the club owner.
    // true only if the requesting Athlete is the club owner.
    var owner: Bool?;
    
    // Total number of members the authenticated Athlete is currently following.
    var followingCount: Int?;
}
