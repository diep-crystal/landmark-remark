//
//  LandmarkService.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation
import KumulosSDK

final class LandmarkService {
    
    enum MethodName {
        static let addNewLocation = "addNewLocation"
        static let getLocations = "getLocations"
    }
    
    func addNewLocation(model: AddLocationModel) -> ServiceRequest<EmptyResponse> {
        let request = ServiceRequest<EmptyResponse>()
        Kumulos.call(MethodName.addNewLocation, parameters: model.toDictionary()).success { (response, _) in
            request.handleEmptyResponse(response: response)
        }
        return request
    }
    
    func getLocations() -> ServiceRequest<LocationCollection> {
        let request = ServiceRequest<LocationCollection>()
        Kumulos.call(MethodName.getLocations).success { (response, _) in
            request.handleResponseJSONArray(response: response)
        }
        return request
    }
}
