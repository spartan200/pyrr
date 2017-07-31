//
//  CFTMapVIewController.swift
//  PYRR
//
//  Created by Collin Thommasen on 2017-07-30.
//  Copyright © 2017 Collin Thommasen. All rights reserved.
//

import Foundation
import MapKit

class CFTMapViewController : CFTBaseViewController, MKMapViewDelegate
{
    @IBOutlet weak var mapView: MKMapView!
    let regionRadius: CLLocationDistance = 1500
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib
        self.mapView.delegate = self
        
        // Set the default location (this location is around westwood)
        let initialLocation = CLLocation(latitude: 49.160510, longitude: -124.003159)
        centerMapOnLocation(location: initialLocation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        NSLog("%f, %f", mapView.region.center.latitude, mapView.region.center.longitude)
    }
}
