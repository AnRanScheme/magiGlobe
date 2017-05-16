//
//  UIScreen+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit


public extension UIScreen {

    
    public var m_mainScreenLongSide: CGFloat {
        let  screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? screenSize.width : screenSize.height;
    }
    
    public var m_mainScreenShortSide: CGFloat {
        let  screenSize = UIScreen.main.bounds.size
        return screenSize.width > screenSize.height ? screenSize.height : screenSize.width;

    }
    

    
}
