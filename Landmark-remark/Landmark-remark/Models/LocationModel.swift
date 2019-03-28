//
//  LocationModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class LocationModel: CoreResponse {

    var locationID: Int?
    var username: String?
    var longitude: Double = 0.0
    var latitude: Double = 0.0
    var note: String?
    var timeCreated: Date?
    
    init(data: [String : Any]?) {
        username = data?["username"] as? String
        locationID = data?["locationID"] as? Int
        timeCreated = data?["timeCreated"] as? Date
        note = data?["note"] as? String
        
        if let temp = data?["latitude"] as? String, let doubleValue = Double(temp) {
            latitude = doubleValue
        }
        
        if let temp = data?["longitude"] as? String, let doubleValue = Double(temp) {
            longitude = doubleValue
        }
    }
    
    init(parametes: AddLocationModel) {
        username = parametes.username
        note = parametes.note
        if let temp = parametes.latitude, let doubleValue = Double(temp) {
            latitude = doubleValue
        }
        
        if let temp = parametes.longitude, let doubleValue = Double(temp) {
            longitude = doubleValue
        }
    }
}
