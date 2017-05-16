//
//  UITableView+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

public extension UITableView{
   public func m_reloadData(_ completion:  (()->Void)? = nil) {
        UIView.animate(withDuration: 0, animations: {
            self.reloadData()
        }, completion: { _ in
            completion?()
        })
    }
    
    public func m_removeTableFooterView() {
        tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    public func m_removeTableHeaderView() {
        tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
    public func m_scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - bounds.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
    
    public func m_scrollToTop(animated: Bool = true) {
        setContentOffset(CGPoint.zero, animated: animated)
    }
}
