//
//  UIAlertController+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//


import UIKit


public extension UIAlertController{
    public func m_show(animated: Bool = true, completion: (() -> Void)? = nil) {
        UIApplication.shared.keyWindow?.rootViewController?.present(self, animated: animated, completion: completion)
    }
    
    @discardableResult public func m_addAction(title: String, style: UIAlertActionStyle = .default, isEnabled: Bool = true, handler: ((UIAlertAction) -> Void)? = nil) -> UIAlertAction {
        let action = UIAlertAction(title: title, style: style, handler: handler)
        action.isEnabled = isEnabled
        self.addAction(action)
        return action
    }
    
    public func m_addTextField(text: String? = nil, placeholder: String? = nil, editingChangedTarget: Any?, editingChangedSelector: Selector?) {
        addTextField { tf in
            tf.text = text
            tf.placeholder = placeholder
            if let target = editingChangedTarget, let selector = editingChangedSelector {
                tf.addTarget(target, action: selector, for: .editingChanged)
            }
        }
    }


    public convenience init(title: String? = nil, message: String? = nil, defaultActionButtonTitle: String = "OK", tintColor: UIColor? = nil) {
        self.init(title: title, message: message, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        self.addAction(defaultAction)
        if let color = tintColor {
            self.view.tintColor = color
        }
    }
    

    public convenience init(title: String = "Error", error: Error, defaultActionButtonTitle: String = "OK", tintColor: UIColor? = nil) {
        self.init(title: title, message: error.localizedDescription, preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: defaultActionButtonTitle, style: .default, handler: nil)
        self.addAction(defaultAction)
        if let color = tintColor {
            self.view.tintColor = color
        }
    }
}
