//
//  Spinner.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/27/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation
import UIKit

final class Spinner: UIView {
    
    static let shared = Spinner()
    
    func show() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        let progress = UIActivityIndicatorView(style: .white)
        progress.center = view.center
        progress.color = .white
        progress.startAnimating()
        view.addSubview(progress)
        
        self.addSubview(view)
        UIApplication.shared.keyWindow?.addSubview(self)
    }
    
    func showInView(sourceView: UIView) {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = UIColor.init(white: 0, alpha: 0.5)
        let progress = UIActivityIndicatorView(style: .white)
        
        progress.center = view.center
        progress.color = .white
        progress.startAnimating()
        view.addSubview(progress)
        self.addSubview(view)
        
        sourceView.addSubview(self)
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return true
    }
    
    func dismiss() {
        for subview in self.subviews {
            subview.removeFromSuperview()
        }
        self.removeFromSuperview()
    }
}
