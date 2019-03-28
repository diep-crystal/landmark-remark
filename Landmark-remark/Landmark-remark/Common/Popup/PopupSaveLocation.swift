//
//  PopupSaveLocation.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation
import UIKit

final class PopupSaveLocation: BasePopupView {
    
    private var firstButtonClosure: (() -> Void)?
    private var secondButtonClosure: (() -> Void)?
    
    func willShow(firstButtonClosure: (() -> Void)? = nil, secondButtonClosure: (() -> Void)? = nil) {
        
        show(popupView: self, with: self.frame)
        self.firstButtonClosure = firstButtonClosure
        self.secondButtonClosure = secondButtonClosure
    }
    
    @IBAction private func actionSave(_ sender: UIButton) {
        secondButtonClosure?()
    }
  
    @IBAction private func actionCancel(_ sender: UIButton) {
        firstButtonClosure?()
    }
}
