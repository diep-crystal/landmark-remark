//
//  BasePopup.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

class BasePopupView: UIView {
    
    private var viewContainer: UIView?
    
    func show(popupView: UIView, with frame: CGRect?) {
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        for subView in window.subviews {
            if let popupSubView = subView as? BasePopupView {
                popupSubView.removeFromSuperview()
                break
            }
        }
        
        if let frame = frame {
            popupView.frame = frame
        } else {
            popupView.frame = window.bounds
        }
        
        
        viewContainer = UIView(frame: window.bounds)
        viewContainer?.backgroundColor = UIColor(white: 0, alpha: 0.5)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        tapGesture.numberOfTapsRequired = 1
        viewContainer?.addGestureRecognizer(tapGesture)
        
        viewContainer?.addSubview(popupView)
        popupView.center = CGPoint(x: viewContainer!.center.x, y: viewContainer!.center.y - 100)
        window.addSubview(viewContainer!)
    }
    
    func dismiss() {
        viewContainer?.removeFromSuperview()
        removeFromSuperview()
    }
    
    @objc private func dismissKeyboard() {
        endEditing(true)
    }
}
