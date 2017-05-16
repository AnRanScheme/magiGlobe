//
//  UIDevice+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

public extension UIDevice {
    // Returns true if the device is iPhone
    public static var  n_isPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.phone
    }
    
    // Returns true if the device is iPad
    public static var  n_isPad: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.pad
    }
    
    @available(iOS 9.0, *)
    public static var  n_isTV: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.tv
    }
    
    @available(iOS 9.0, *)
    public static var  n_isCar: Bool {
        return UIDevice.current.userInterfaceIdiom == UIUserInterfaceIdiom.carPlay
    }
    
    
    
}
