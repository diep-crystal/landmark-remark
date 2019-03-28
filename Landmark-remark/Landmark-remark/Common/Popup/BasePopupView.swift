//
//  BasePopup.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

class BasePopupView: UIView {
    
    func show(popupView: UIView) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        for subView in window.subviews {
            if let popupSubView = subView as? BasePopupView {
                popupSubView.removeFromSuperview()
                break
            }
        }
        
        popupView.frame = window.bounds
        window.addSubview(popupView)
    }
    
    func dismiss() {
        self.removeFromSuperview()
    }
}
