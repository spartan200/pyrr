//
//  ActivitySummary.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

/**
 * Enum for the type of activity
 */
public enum ActivityType: String {
    case Ride = "ride"
    case Run = "run"
    case Swim = "swim"
    case Etc = "etc"
}

/**
 * Enum for the workout type
 */
public enum WorkoutType: Int {
    case DefaultRun = 0
    case RaceRun = 1
    case LongRun = 2
    case WorkoutRun = 3
    case DefaultRide = 10
    case RaceRide = 11
    case WorkoutRide = 12
}
class ActivitySummary: ActivityMeta {
    // External id for the Activity.  Provided at upload.
    var externalId: String?;
    
    // The id of the Activity Upload.
    var uploadId: Int?;
    
    // The Athlete that performed the Activity.  Meta or Summary.
    var athlete: AthleteMeta?;
    
    // The name of the Activity.
    var name: String?;
    
    // Distiance that is covered during the Activity.
    // Meters
    var distance: Float?;
    
    // The time the Athlete was moving during the Activity.
    // Seconds
    var movingTime: Int?;
    
    // The elapsed time of the Activity.
    // Seconds
    var elapsedTime: Int?;
    
    // Total elevation that was gained during the Activity.
    // Meters.
    var totalElavationGain: Float?;
    
    // The highest point of elevation during the Activity.
    // Meters
    var elevHigh: Float?;
    
    // The lowest point of elevation during the Activity.
    // Meters
    var elevLow: Float?;
    
    // The type of Activity.
    // Values: 'ride', 'run', 'swim', 'etc'.
    var type: ActivityType?;
    
    // Start date of the actitivity, UTC Time.
    var startDate: Date?;
    
    // The Start Date Local time of the activity
    var startDateLocal: Date?;
    
    // The timezone that Activity was performed in.
    var timezone: String?;
    
    // Starting latitude and longitude of the Activity.
    // TODO: Needs to be Latitude/Longitude Struct
    var startLatLng: String?;
    
    // Ending latitude and longitude of the Activity.
    // TODO: Needs to Latitude/Longitude Struct
    var endLatLng: String?;
    
    // The number of achievements achieved during the Activity.
    var achievementCount: Int?;
    
    // The number of Kudos for the Activity.
    var kudosCount: Int?;
    
    // The number of Comments for the Activity.
    var commentCount: Int?;
    
    //  The number of Athletes taking part in this "group activity". >= 1
    var athleteCount: Int?;
    
    // The number of instagram photos
    var photoCount: Int?;
    
    // The total number of photos (Instagram and Strava)
    var totalPhotoCount: Int?;
    
    // The detailed representation of the route
    var map: Map?;
    
    // True/False depending on if the a trainer was used.
    var trainer: Bool?;
    
    // True/False depending on if was part of the Athletes daily commute.
    var commute: Bool?;
    
    // True/False depending on if this was manual?
    var manual: Bool?;
    
    // True/False depending on if this is a Private Activity.
    // Note: actual field is just private.
    var privateActivity: Bool?;
    
    // TODO: Not too sure what this means
    var flagged: Bool?;
    
    // The type of workout the Activity was.
    // Values for Run: 0->'default', 1->'race', 2->'long run', 3->'workout'
    // Values for Ride: 10->'default', 11->'race', 12->'workout'
    var workoutType: WorkoutType?;
    
    // Gear Id for the Activity.  Corresponds to a bike or pair of shoes included in athlete details.
    var gearId: Int?;
    
    // Average speed of the Athlete during the Activity.
    // meteres per second
    var averageSpeed: Float?;
    
    // Maximum speed of the Athlete during the Activity.
    // meters per second
    var maxSpeed: Float?;
    
    // Average cadence for the Athlete during the Activity.
    // RPM, if provided at upload
    var averageCadence: Float?;
    
    // Average temperature outside during the Activity.
    // Degrees Celsius, if provided at upload
    var averageTemp: Float?;
    
    // Average Watts produced by the Athlete during the Activity
    // Rides only
    var averageWatts: Float?;
    
    // Maximum Watts produced by the Athlete during the Activity.
    // Rides with power meter data onlu.
    var maxWatts: Float?;
    
    // Estimated power produced by the Athlete during the Activity.
    // Rides only, uses estimated power if necessary.
    var kilojoules: Float?;
    
    // True/False depending on if the Athlete is using a heartrate monitor.
    var hasHeartrate: Bool?;
    
    // Average heart rate of the Athlete during the Activity.
    // Only if recorded with heartrate average over moving portion.
    var averageHeartRate: Float?;
    
    // The maximum heart rate reached by the Athlete during the Activity.
    var maxHeartRate: Int?;
    
    // A measure of heart rate intensity, available on premimum users' activities only
    var sufferScore: Int?;
    
    // True/False depending if the authenticated user has kudoed the activity.
    var hasKudoed: Bool?;
}
