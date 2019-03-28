//
//  RemarkMapViewController.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit
import MapKit

final class RemarkMapViewController: UIViewController {

    //MARK:- Outlets
    @IBOutlet private weak var mapView: MKMapView!
    
    //MARK:- Private propeties
    private var locationManager: CLLocationManager!
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.showsUserLocation = true
        mapView.delegate = self
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
        }
    }
    
    //MARK:- Private methods
}

// MARK:- CLLocationManagerDelegate
extension RemarkMapViewController: CLLocationManagerDelegate {
    
}

//MARK:- MKMapViewDelegate
extension RemarkMapViewController: MKMapViewDelegate {
    
}
