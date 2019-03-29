//
//  String+Extension.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/29/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import UIKit

extension String {
    func localize() -> String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localize(arguments: String...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: arguments)
    }
    
    func localize(arguments: CVarArg...) -> String {
        return String(format: NSLocalizedString(self, comment: ""), arguments: arguments)
    }
}

