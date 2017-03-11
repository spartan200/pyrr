//
//  ClubSummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class ClubSummary: ClubMeta {
    // Profile picture for the club.  URL to a 60x60 pixel profile picture.
    var profileMedium: String?;
    
    // Profile picture for the club.  URL to a 124x124 pixel profile picture.
    var profile: String?;
    
    // Cover photo for the club.  URL to a ~1185x580 pixel cover photo.
    var coverPhoto: String?;
    
    // Small cover photo for the club.  URL to a ~360x176 pixel cover photo.
    var coverPhotoSmall: String?;
    
    // Sport Type for the club.
    // Values: cycling, runnning, triathlon, other.
    // TODO: Should be an enum
    var sportType: String?;
    
    // City the club is in.
    var city: String?;
    
    // State the club is in.
    var state: String?;
    
    // Country the club is in.
    var country: String?;
    
    // Boolean value for whether or not the club is private.
    // Note: value is actually just 'private'.
    var privateClub: Bool?;
    
    
    // The number of members that belong to the club.
    var memberCount: Int?;
    
    // Boolean value for whether or not the club is featured.
    var featured: Bool?;
    
    // Boolean value for whether or not he club is featured.
    var verified: Bool?;
    
    // The URL for the club.  Vanity club URL slug.
    var url: String?;
}
