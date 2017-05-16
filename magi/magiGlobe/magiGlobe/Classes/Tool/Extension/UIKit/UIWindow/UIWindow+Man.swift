//
//  UIWindow+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit


public extension UIWindow {
    
    
    public func m_topMostController() -> UIViewController? {
       var topController = self.rootViewController
        while topController?.presentedViewController != nil {
            topController = topController?.presentedViewController
        }
        return topController
    }
    
    public func m_currentViewController() -> UIViewController? {
        var currentViewController = self.m_topMostController()
        while currentViewController is UINavigationController && (currentViewController as? UINavigationController)?.topViewController != nil{
            currentViewController = (currentViewController as? UINavigationController)?.topViewController
        }
        return currentViewController
    }
    
}
