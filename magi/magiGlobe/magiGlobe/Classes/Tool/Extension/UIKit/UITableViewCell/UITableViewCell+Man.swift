//
//  UITableViewCell+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit


public extension UITableViewCell{
    public static func m_nib() -> UINib {
        return  UINib(nibName: String(describing: self), bundle: nil)
    }
}
