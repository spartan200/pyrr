//
//  Athlete.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class Athlete: AthleteSummary {
    // The number of followers the Athlete has.
    var followerCount: Int?;
    
    // The number of friends the Athlete has.
    var friendCount: Int?;
    
    // The number of mutual friends the Athlete has.
    var mutualFriendCount: Int?;
    
    // The Athlete's default sport type.
    // Values: 0=cyclist, 1=runner.
    // TODO: Should be an enum.
    var athleteType: Int?;
    
    // The preferred format for dates the Athlete uses.
    var datePreference: String?;
    
    // The preferred unit of measurement for the Athlete.
    // Values: 'feet' or 'meters'
    // TODO: Should be an enum.
    var measurementPreference: String?;
    
    // The email address for the Athlete.
    var email: String?;
    
    // TODO: Not sure what this does
    var ftp: Int?;
    
    // The weight in kilograms of the athlete
    var weight: Float?;
    
    // An array containing all the clubs that Athlete belongs to.
    var clubs: Array<Club>?;
    
    // An array containing all the bikes that the Athlete has entered.
    var bikes: Array<Gear>?;
    
    // An array containing all the shoes that the Athlete has entered.
    var shoes: Array<Gear>?;
}
