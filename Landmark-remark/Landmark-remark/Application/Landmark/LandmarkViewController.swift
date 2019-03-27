//
//  ViewController.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit
import MapKit

final class LandmarkViewController: UIViewController {

    @IBOutlet private weak var mapView: MKMapView!
    private var locationManager: CLLocationManager!
    
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
    
    @IBAction private func saveLocation(_ sender: UIButton) {
        
    }
    
}

extension LandmarkViewController: CLLocationManagerDelegate {
    
}

extension LandmarkViewController: MKMapViewDelegate {
    
}

