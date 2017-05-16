//
//  UIBarButtonItem+man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

public extension UIBarButtonItem {
    //添加一个构造方法 通过传递 图片名称 和 target 和 action 就能够创建对象
    //函数的参数如果指定默认值 该参数可以省略不传 实际上系统会对该函数生成两个方法名
    convenience init(title: String = "",imageName: String? = nil,target: Any?, action: Selector) {
        let btn = UIButton()
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(UIColor.darkGray, for: .normal)
        btn.setTitleColor(UIColor.orange, for: .highlighted)
        //设置字号
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        if imageName != nil {
            
            btn.setImage(UIImage(named: imageName!), for: .normal)
            btn.setImage(UIImage(named: imageName! + "_highlighted"), for: .highlighted)
        }
        btn.sizeToFit()
        //添加点击事件
        btn.addTarget(target, action: action, for: .touchUpInside)
        self.init()
        //给当前对象设置自定义视图
        self.customView = btn
    }
}
