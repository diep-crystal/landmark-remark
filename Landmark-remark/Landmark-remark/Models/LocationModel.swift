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
    var longitude: String?
    var latitude: String?
    var note: String?
    var timeCreated: Date?
    
    init(data: [String : Any]?) {
        username = data?["username"] as? String
        locationID = data?["locationID"] as? Int
        timeCreated = data?["timeCreated"] as? Date
        note = data?["note"] as? String
        latitude = data?["latitude"] as? String
        longitude = data?["longitude"] as? String
    }
}
