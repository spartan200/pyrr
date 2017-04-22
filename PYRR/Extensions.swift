//
//  Extensions.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-22.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

extension Date {
    init?(jsonDate: String) {
        let isoFormatter = ISO8601DateFormatter()
        
        self = isoFormatter.date(from: jsonDate)!
    }
}
