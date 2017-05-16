//
//  UIImageView+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit


extension UIImageView {
    
    ///  Make image view blurry
    ///
    /// - Parameter withStyle: UIBlurEffectStyle (default is .light).
    func m_blur(withStyle: UIBlurEffectStyle = .light) {
        let blurEffect = UIBlurEffect(style: withStyle)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        self.addSubview(blurEffectView)
        self.clipsToBounds = true
    }
}
