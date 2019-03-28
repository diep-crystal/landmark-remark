//
//  CircleView.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

@IBDesignable class UICircleView: UIView {
    
    @IBInspectable var isCircle: Bool = false {
        didSet {
            if self.isCircle == true {
                self.layer.masksToBounds = true
                self.layer.cornerRadius = self.bounds.width / 2
            }
        }
    }
}
