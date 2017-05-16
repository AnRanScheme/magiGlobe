//
//  Int+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import Foundation

public extension Int {
    public var m_isEven:Bool     {return (self % 2 == 0)}
    public var m_isOdd:Bool      {return (self % 2 != 0)}
    
    public var m_toDouble:Double {return Double(self)}
    public var m_toFloat:Float   {return Float(self)}
}
