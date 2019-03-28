//
//  LandmarkAnnotationView.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import MapKit

final class RemarkAnnotationView: MKAnnotationView {
    
    override var annotation: MKAnnotation? {
        willSet {
            guard let marker = newValue as? RemarkAnnotation else {
                return
            }
            
            canShowCallout = true
            calloutOffset = CGPoint(x: 5, y: 5)
            let mapsButton = UIButton(frame: CGRect(origin: CGPoint.zero,
                                                    size: CGSize(width: 30, height: 30)))
            mapsButton.setBackgroundImage(UIImage(named: "Maps-icon"), for: .normal)
            rightCalloutAccessoryView = mapsButton
            tintColor = .blue
            if let markerImage = marker.imageName {
                image = UIImage(named: markerImage)
            } else {
                image = nil
            }
        }
    }
}
