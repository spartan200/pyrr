//
//  LeaderboardBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/// - Type of function that gets called when the get records finishes
typealias LeaderboardResponse = (Leaderboard) -> Void

class LeaderboardBroker: StravaBroker
{
    /// - Function gets the array of leaderboard entry objects.
    ///   If the requesting athelete has completed this segment, their entry, along
    ///   with "context" will be returned.
    ///   For example, if the requesting athlete is 15th on a segment, the default result
    ///   will include the top 10 plus 13-17 (number 15 plus/minus 2)
    func getRecords(segmentId: Int, onCompletion: @escaping LeaderboardResponse)
    {
        makeHTTPGetRequest(requestName: "segments/\(segmentId)/leaderboard", parameters: nil, onCompletion: {data, err in
            if (err == nil) {
                // TODO: Need to handle the error part
            }
            
            let leaderboard = Leaderboard.parseLeaderboard(rawData: data!)
            
            onCompletion(leaderboard)
        })
    }
}
