//
//  Bool+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import Foundation
public extension Bool {
    
    @discardableResult public mutating func m_toggle() -> Bool {
        self = !self
        return self
    }
}

