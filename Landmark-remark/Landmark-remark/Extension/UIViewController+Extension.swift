//
//  UIViewController+Extension.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func add(containerView: UIView, asChildViewController viewController: UIViewController?) {
        guard let childViewController = viewController else {
            return
        }
        
        // Add Child View Controller
        addChild(childViewController)
        
        // Add Child View as Subview
        containerView.addSubview(childViewController.view)
        
        // Configure Child View
        childViewController.view.frame = containerView.bounds
        childViewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        // Notify Child View Controller
        childViewController.didMove(toParent: self)
    }
    
    func remove(asChildViewController childViewController: UIViewController?) {
        
        // Notify Child View Controller
        childViewController?.willMove(toParent: nil)
        
        // Remove Child View From Superview
        childViewController?.view.removeFromSuperview()
        
        // Notify Child View Controller
        childViewController?.removeFromParent()
    }
}
