//
//  Leaderboard.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

class Leaderboard
{
    // The number of total entries on the leaderboard
    var entryCount: Int?;
    
    // Function that contains a array of entryies for the leadboard
    var entries: [LeaderboardEntry]?;
    
    /// - Function that parses the given JSON data into a leaderboard.
    static func parseLeaderboard(rawData: Data) -> Leaderboard
    {
        let leaderboard = Leaderboard()
        leaderboard.entries = [LeaderboardEntry]()
        
        if let parsedData = try? JSONSerialization.jsonObject(with: rawData) as! [String: Any] {
            //let activity = Activity(fromDict: parsedData)
            //onCompletion(activity)
            leaderboard.entryCount = parsedData["entry_count"] as! Int?
            
            let rawEntries = parsedData["entries"] as! [[String: Any]]
            
            for entryDict in rawEntries {
                leaderboard.entries!.append(LeaderboardEntry(fromDict: entryDict))
            }
        } else {
            // TODO: Need to handle when there is an error parsing the JSON
            NSLog("bad json - do some recovery")
        }
        
        return leaderboard;
    }
}
