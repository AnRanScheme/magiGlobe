//
//  UINavigationBar+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//
import UIKit

public extension UINavigationBar {
    
    public func m_setTitleFont(_ font: UIFont, color: UIColor = UIColor.black) {
        var attrs = [String: AnyObject]()
        attrs[NSFontAttributeName] = font
        attrs[NSForegroundColorAttributeName] = color
        titleTextAttributes = attrs
    }
    

    public func m_makeTransparent(withTint: UIColor = .white) {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
        tintColor = withTint
        titleTextAttributes = [NSForegroundColorAttributeName: withTint]
    }
    
    public func m_setColors(background: UIColor, text: UIColor) {
        self.isTranslucent = false
        self.backgroundColor = background
        self.barTintColor = background
        self.setBackgroundImage(UIImage(), for: .default)
        self.tintColor = text
        self.titleTextAttributes = [NSForegroundColorAttributeName: text]
    }
}
