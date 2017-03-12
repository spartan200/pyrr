//
//  StravaBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-03-11.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//
//  "Abstract" class that should be inherited from for talking to the Strava REST Service.

import Foundation
import Security

typealias ServiceResponse = (Data?, Error?) -> Void;

public typealias ParamsDictionary = [String : Any ];
/**
 * HTTP Methods
 */
public enum HTTPMethod: String {
    case GET = "GET"
    case POST = "POST"
    case PUT = "PUT"
}

class StravaBroker {
    static let sharedInstance = StravaBroker();
    
    
    // The base URL to the Strava API
    let baseURL = "https://www.strava.com/api/v3/athlete";
    
    func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse) {
        let request = NSMutableURLRequest(url: NSURL(string: path)! as URL);
        request.httpMethod = "GET"
        let accessToken = "6bd0c322bc830a9ee2da4e534bbcc927559b453c"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        let session = URLSession.shared;

        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, error in
            //let json:JSON = JSON(data: data);
            print(NSString(data: data!, encoding: String.Encoding.utf8.rawValue) ?? "Nothing")
            onCompletion(data, error);
        })
        
        task.resume();
    }
    
    /**
     * Function can be used to test the strava broker
    */
    func StravaBrokerTest() {
        self.makeHTTPGetRequest(path: baseURL, onCompletion: {string, err in
            NSLog("Stop");
        });
    }
}
