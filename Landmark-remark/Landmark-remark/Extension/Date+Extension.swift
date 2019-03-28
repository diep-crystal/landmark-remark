//
//  Date+Extension.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import Foundation

extension Date {
    
    var dateString: String {
        return Formatter.serverFormatter.string(from: self)
    }
}

extension Formatter {
    
    static let serverFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter
    }()
}
