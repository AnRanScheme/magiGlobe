//
//  UISearchBar+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit


public extension UISearchBar {
    
    ///  Text field inside search bar (if applicable).
    public var m_textField: UITextField? {
        let subViews = subviews.flatMap { $0.subviews }
        guard let textField = (subViews.filter { $0 is UITextField }).first as? UITextField else {
            return nil
        }
        return textField
    }
    

    
}
