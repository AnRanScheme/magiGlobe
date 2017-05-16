//
//  UITextField+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

#if os(iOS) || os(tvOS)

import UIKit


public extension UITextField {
    
    public func m_setPlaceholderTextColor(_ color: UIColor) {
        self.attributedPlaceholder = NSAttributedString(string:self.placeholder ??  "", attributes:[NSForegroundColorAttributeName: color])
    }
}

#endif
