//
//  NSDate+Comparable.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

extension NSDate: Comparable {}

//  Returns if dates are equal to each other
public func == (lhs: NSDate, rhs: NSDate) -> Bool {
    return (lhs == rhs)
}
//  Returns if one date is smaller than the other
public func < (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending
}

public func > (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedDescending
}

public func <= (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedAscending || lhs.compare(rhs as Date) == .orderedSame
}

public func >= (lhs: NSDate, rhs: NSDate) -> Bool {
    return lhs.compare(rhs as Date) == .orderedDescending || lhs.compare(rhs as Date) == .orderedSame
}
