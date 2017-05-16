//
//  UINavigationController+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

public extension UINavigationController {
    
    private func doInTransaction(_ block: ()->(), completion:  (()->Void)? = nil)
    {
        CATransaction.begin()
        CATransaction.setCompletionBlock(completion)
        block()
        CATransaction.commit()
    }
    
    public func m_popViewController(completion: (()->Void)? = nil)
    {
        self.doInTransaction({ popViewController(animated: true) }, completion: completion)
    }
    
    public func m_pushViewController(viewController: UIViewController, completion: (()->Void)? = nil)
    {
        self.doInTransaction({pushViewController(viewController, animated: true)}, completion: completion)
    }
    
}
