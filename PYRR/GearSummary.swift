//
//  Gear.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//
// The equivalent to the GearSummary for Strava.

import Foundation

class GearSummary {
    // The id of the gear
    var gearId: Int?;
    
    // The athletes default bike/shoes.
    var primary: Bool?;
    
    // The name of the gear.  Athlete entered for bikes, generated from brand
    // and model for shoes.
    var name: String?;
    
    // The distance the gear has been used.
    var distance: Float?;
    
    // The resource state for the gear.
    var resourceState: Int?;
}
