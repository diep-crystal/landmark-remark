//
//  DataBinding.swift
//  Landmark-remark
//
//  Created by Diep Nguyen on 3/28/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

public final class DataBinding<T> {
    
    public typealias Handler = (T) -> Void
    private var handlers:[Handler] = []
    
    public var value: T? {
        didSet {
            if let _ = value {
                self.fire()
            }
        }
    }
    
    public init(value: T? = nil) {
        self.value = value
    }
    
    public func bind(hdl: @escaping Handler) {
        handlers.append(hdl)
    }
    
    public func subcribe(hdl: @escaping Handler) {
        bind(hdl: hdl)
        fire()
    }
    
    private func fire() {
        handlers.forEach { (hdl: Handler) in
            if let value = self.value {
                hdl(value)
            }
        }
    }
}
