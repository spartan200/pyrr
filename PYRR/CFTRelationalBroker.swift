//
//  CFTRelationalBroker.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-05-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import SQLite

class CFTRelationalBroker
{
    /// - Function returns the database path
    func getPath() -> String {
        let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("PYRR.sqlite3")
        
        debugPrint(fileURL.path)
        
        return fileURL.path
    }
    
    /// - Function to create a database table
    func createTable(sqlStmt: String) -> Bool {
        let db = try! Connection(getPath())
        
        try! db.run(sqlStmt)
        
        return true
    }
    
    /// - Function needs to be overriden by the child class
    func createTable() -> Bool {
        assertionFailure("Need to implement Create Table")
        return false
    }
}
