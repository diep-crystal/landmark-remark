//
//  LocationCollection.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class LocationCollection: CoreResponse {

    var objectList = [LocationModel]()
    
    init(data: [String : Any]?) {
        if let objects = data?["items"] as? [[String: Any]] {
            objectList = objects.map({ (item) -> LocationModel in
                return LocationModel(data: item)
            })
        }
    }
}
