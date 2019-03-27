//
//  LandmarkViewModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation

final class LandmarkViewModel {
    
    private let service = LandmarkService()
    
    func saveLocation(model: AddLocationModel) {
        Spinner.shared.show()
        service.addNewLocation(model: model).cloudResponse { (response) in
            //
            }.cloudError { (msg: String, _: Int?) in
                //
            }.finally {
                Spinner.shared.dismiss()
        }
    }
    
    func getLocations() {
        
        service.getLocations().cloudResponse { [weak self](collection: LocationCollection) in
            
            }.cloudError { (msgError, _: Int?) in
                //
            }.finally {
                Spinner.shared.dismiss()
        }
    }
}
