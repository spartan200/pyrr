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
    let baseURL = "https://www.strava.com/api/v3/";
    
    func makeHTTPGetRequest(requestName: String, parameters: [String: AnyObject], onCompletion: @escaping ServiceResponse) {
        let parameterString = parameters.stringFromHttpParameters()
        let requestURL = NSURL(string: "\(baseURL)\(requestName)?\(parameterString)")!
        let request = NSMutableURLRequest(url: requestURL as URL)
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
        self.makeHTTPGetRequest(requestName: "athlete", parameters: [String: AnyObject](), onCompletion: {string, err in
            NSLog("Stop");
        });
    }
}

extension String {
    /// Percent escaped values to be added to a URL query as specified in RFC 3986
    ///
    /// This percent-escapes all characters besides the alphanumeric character set and "-", ".", "_", and "~".
    ///
    /// http://www.ietf.org/rfc/rfcc3986.txt
    ///
    /// :returns: Returns percent-escaped string.
    func addingPercentEncodingForURLQueryValue() -> String? {
        let allowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ-._~")
        
        return self.addingPercentEncoding(withAllowedCharacters: allowedCharacters)
    }
}

extension Dictionary {
    /// Build string representation of HTTP parameter dictionary of keys and objects
    ///
    /// This percent escapes in compliance with RFC 3986
    ///
    /// http://www.ietf.org/rfc/rfc3986.txt
    ///
    /// :returns: String representation in the form of key1=value1&key2=value2 where the keys and values are percent escaped
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let percentEscapedKey = (key as! String).addingPercentEncodingForURLQueryValue()!
            let percentEscapedValue = (value as! String).addingPercentEncodingForURLQueryValue()!
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}
