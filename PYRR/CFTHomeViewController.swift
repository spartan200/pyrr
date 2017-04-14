//
//  CFTHomeViewController.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-04-14.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import UIKit

class CFTHomeViewController: CFTBaseViewController, UITableViewDataSource, UITableViewDelegate
{
    // Variable that contains the activities that are displayed in the table view
    var activities: [Activity] = []
    
    // Reference to the table view on the view controller
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        
        self.tableView!.dataSource = self
        self.tableView!.delegate = self
        
        let activityBroker = ActivityBroker()
        
        activityBroker.getRecordsForAthlete(onCompletion: {activityArr in
                self.activities = activityArr
            
                self.tableView.reloadData()
            });
    }
    
    // MARK: UITableView Delegate and Data Source functions
    
    /// - Number of sections in the tableview, always 1.
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath)
        
        cell.textLabel?.text = activities[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 30
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return activities.count
    }
}
