//
//  NSBundle+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import Foundation
public extension Bundle {
    
    /// 返回main中bundle
    ///
    /// - Returns: 返回main中可选bundle
    public convenience init?(bundleName: String){
        let bundlePath = Bundle.main.path(forResource: bundleName, ofType: "bundle")
        guard bundlePath != nil else{
            return nil
        }
        self.init(path: bundlePath!)
    }
    
    
}
