//
//  PopupSaveLocationViewModel.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

final class PopupSaveLocationViewModel {
    
    var model = AddLocationModel()
    var validateCompleted: DataBinding<Bool>?
    
    init() {
        validateCompleted = DataBinding()
    }
    
    func validateData() {
        
        guard let username = model.username, !username.isEmpty  else {
            validateCompleted?.value = false
            return
        }
        
        guard let notes = model.note, !notes.isEmpty else {
            validateCompleted?.value = false
            return
        }
        
        validateCompleted?.value = true
    }
}
