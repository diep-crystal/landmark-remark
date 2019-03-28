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
    private let regionRadius: CLLocationDistance = 10000
    
    //MARK:- Public properties
    let viewModel = RemarkMapViewModel()
    
    //MARK:- Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }
    
    func showAnnotations(locations: [LocationModel]?) {
        
        guard let locations = locations else {
            return
        }
        
        let annotations = locations.map { (location: LocationModel) -> RemarkAnnotation in
            let annotation = RemarkAnnotation(title: location.username ?? "", locationName: location.note ?? "", coordinate: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude))
            return annotation
        }.compactMap({$0})
        
        mapView.removeAnnotations(mapView.annotations)
        mapView.addAnnotations(annotations)
    }
    
    func focusMapOn(location: CLLocation) {
        let coodinateLocation = MKCoordinateRegion(center: location.coordinate,
                                                   latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapView.setRegion(coodinateLocation, animated: true)
    }
    
    //MARK:- Private methods
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
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
