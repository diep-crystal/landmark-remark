//
//  LandmarkViewModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation

final class LandmarkViewModel {
    
    //MARK:- Private properties
    private let service = LandmarkService()
    
    var loadLocationSuccess: DataBinding<LocationCollection>?
    var addLocationSuccess: DataBinding<LocationModel>?
    
    //MARK:- Public methods
    init() {
        loadLocationSuccess = DataBinding()
        addLocationSuccess = DataBinding()
    }
    
    func saveLocation(model: AddLocationModel) {
        Spinner.shared.show()
        service.addNewLocation(model: model).cloudResponse { [weak self](response) in
            self?.addLocationSuccess?.value = LocationModel(parametes: model)
            }.cloudError { (msg: String, _: Int?) in
                //TODO: handle error
            }.finally {
                Spinner.shared.dismiss()
        }
    }
    
    func getLocations() {
        
        service.getLocations().cloudResponse { [weak self](collection: LocationCollection) in
            self?.loadLocationSuccess?.value = collection
            }.cloudError { (msgError, _: Int?) in
                //TODO: handle error
            }.finally {
                Spinner.shared.dismiss()
        }
    }
}
