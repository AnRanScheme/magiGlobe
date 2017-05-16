//
//  UITabBar+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

public extension UITabBar {
    
    /// Set tabBar colors.
    ///
    /// - Parameters:
    ///   - background: background color.
    ///   - selectedBackground: background color for selected tab.
    ///   - item: icon tint color for items.
    ///   - selectedItem: icon tint color for item.
    public func m_setColors(background: UIColor? = nil,
                          selectedBackground: UIColor? = nil,
                          item: UIColor? = nil,
                          selectedItem: UIColor? = nil) {
        
        // background
        self.barTintColor = background ?? self.barTintColor
        
        // selectedItem
        self.tintColor = selectedItem ?? self.tintColor
        //		self.shadowImage = UIImage()
        self.backgroundImage = UIImage()
        self.isTranslucent = false
        
        // selectedBackgoundColor
        
        if let selectedbg = selectedBackground {
            let rect = CGSize(width: self.frame.width/CGFloat(self.items!.count), height: self.frame.height)
            self.selectionIndicatorImage = UIImage.m_image(color: selectedbg, size: rect)

        }
        
        if let itemColor = item {
            for barItem in self.items! as [UITabBarItem] {
                // item
                if let image = barItem.image {
                    barItem.image = image.m_filled(withColor: itemColor).withRenderingMode(.alwaysOriginal)
                    barItem.setTitleTextAttributes([NSForegroundColorAttributeName : itemColor], for: .normal)
                    if let selected = selectedItem {
                        barItem.setTitleTextAttributes([NSForegroundColorAttributeName : selected], for: .selected)
                    }
                }
            }
        }
    }
}
