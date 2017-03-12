//
//  Requestor.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-12.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation

public protocol Requestor {
    var baseUrl: String {get set}
    
    func request(_ method: HTTPMethod, authenticated: Bool, path: String, params: ParamsDictionary?, completionHandler: ((_ response: Any?, _ error: NSError?) -> ())?) -> URLSessionTask?
    
}
