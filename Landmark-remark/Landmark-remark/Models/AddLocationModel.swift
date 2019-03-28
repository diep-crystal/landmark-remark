//
//  AddLocationModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation

struct AddLocationModel: CoreParameter {
    
    var username: String?
    var longitude: String?
    var latitude: String?
    var note: String?
    
    func toDictionary() -> [String : AnyObject] {
        var params = [String: Any]()
        params["username"] = username
        params["longitude"] = longitude
        params["latitude"] = latitude
        params["note"] = note
        return params as [String : AnyObject]
    }
}
