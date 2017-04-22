//
//  LeaderboardEntry.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class LeaderboardEntry
{
    // The name of the athlete
    var athleteName: String?;
    
    // The id for the athlete
    var athleteId: Int?;
    
    // The gender of the athlete
    // M for male and F for female
    var athleteGender: String?;
    
    // Average Hour
    var averageHr: Float?;
    
    // Average Watts
    var averageWatts: Float?;
    
    // Distance
    var distance: Float?;
    
    // Elapsed Time
    var elapsedTime: Int?;
    
    // Moving Time
    var movingTime: Int?;
    
    // Start Date
    var startDate: Date?;
    
    // Start Date Local
    var startDateLocal: Date?;
    
    // The id of the activity the leaderboard entry was achieved on
    var activityId: Int?;
    
    // The effort id
    var effortId: Int?;
    
    // The rank on the leaderboard
    var rank: Int?;
    
    // URL for the atheletes profile picture
    var athleteProfile: String?;
    
    // Initializes an LeaderboardEntry object from the given dictionary
    init(fromDict: [String: Any]) {
        self.athleteName = fromDict["athlete_name"] as? String
        self.athleteId = fromDict["athlete_id"] as? Int
        self.athleteGender = fromDict["athlete_gender"] as? String
        self.averageHr = fromDict["average_hr"] as? Float
        self.averageWatts = fromDict["average_watts"] as? Float
        self.distance = fromDict["distance"] as? Float
        self.elapsedTime = fromDict["elapsed_time"] as? Int
        self.movingTime = fromDict["moving_time"] as? Int
        self.startDate = Date(jsonDate: fromDict["start_date"] as! String)
        self.startDateLocal = Date(jsonDate: fromDict["start_date_local"] as! String)
        self.activityId = fromDict["activity_id"] as? Int
        self.effortId = fromDict["effort_id"] as? Int
        self.rank = fromDict["rank"] as? Int
        self.athleteProfile = fromDict["athlete_profile"] as? String
    }
}
