//
//  NSObject+Extension.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension NSObject {
    
    var className: String {
        
        return String(describing: type(of: self))
    }
    
    class var className: String {
        
        return String(describing: self)
    }
}
