//
//  LandmarkAnnotation.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import MapKit

final class RemarkAnnotation: NSObject, MKAnnotation {
    
    let title: String?
    let locationName: String
    let coordinate: CLLocationCoordinate2D
    
    var imageName: String? {
        return "ic-places-on-maps"
    }
    
    var subtitle: String? {
        return locationName
    }
    
    init(title: String, locationName: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.coordinate = coordinate
    }
    
    func mapItem() -> MKMapItem {

        let placemark = MKPlacemark(coordinate: coordinate)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        
        return mapItem
    }
}
