//
//  NSObject+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import Foundation
 public extension NSObject {
    
    /// 类名
    public var m_className: String {
        return type(of: self).m_className
    }
    
    /// 类名
    public static var m_className: String {
        return String(describing: self)
    }
}
