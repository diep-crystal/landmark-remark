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
    private let regionRadius: CLLocationDistance = 1000
    
    //MARK:- Public properties
    let viewModel = RemarkMapViewModel()
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        requestLocationAuthorizationStatus()
        
        let initialLocation = CLLocation(latitude: 21.013863, longitude: 105.7952583)
        focusMapOn(location: initialLocation)
    }
    
    func showAnnotations(locations: [LocationModel]) {
        let annotations = locations.map { (location: LocationModel) -> RemarkAnnotation in
            let annotation = RemarkAnnotation(title: location.username ?? "", locationName: location.note ?? "", coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            return annotation
        }
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }
    
    //MARK:- Private methods
    private func requestLocationAuthorizationStatus() {
        guard CLLocationManager.locationServicesEnabled() else {
            return
        }
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        if (CLLocationManager.authorizationStatus() == .authorizedAlways) {
           mapView.showsUserLocation = true
        } else {
            locationManager.requestAlwaysAuthorization()
        }
    }
    
    private func setupMapView() {
        mapView.delegate = self
    }
    
    private func focusMapOn(location: CLLocation) {
        let coodinateLocation = MKCoordinateRegion(center: location.coordinate,
                                                   latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coodinateLocation, animated: true)
    }
}

// MARK:- CLLocationManagerDelegate
extension RemarkMapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways, .authorizedWhenInUse:
            mapView.showsUserLocation = true
        default:
            break
        }
    }
}

//MARK:- MKMapViewDelegate
extension RemarkMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is RemarkAnnotation else {
            return nil
        }
        
        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: RemarkAnnotationView.className)
        if pinView == nil {
            pinView = RemarkAnnotationView(annotation: annotation, reuseIdentifier: RemarkAnnotationView.className)
        } else {
            pinView?.annotation = annotation
        }
        
        return pinView
        
    }
}
