//
//  ARAMainTabBar.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

class ARAMainTabBar: UITabBar {
    
    // MARK: - 控件
    // 通过懒加载实例化撰写微博的按钮
    private lazy var composeBtn : UIButton = {
        let btn = UIButton()
        btn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add"), for: .normal)
        btn.setImage(#imageLiteral(resourceName: "tabbar_compose_icon_add_highlighted"), for: .highlighted)
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button"), for: .normal)
        btn.setBackgroundImage(#imageLiteral(resourceName: "tabbar_compose_button_highlighted"), for: .highlighted)
        return btn
    }()

    // MARK: - 属性
    var composeClosure: (()->())?
    
    // MARK: - 系统方法

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(composeBtn)
        composeBtn.addTarget(self, action: #selector(composeBtnDidClick), for: .touchUpInside)
    }

    //解档 当视图从 xib 或者 sb中加载的时候会执行这个方法
    //从xib中加载该控件程序会崩溃
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let btnW = self.bounds.width / 5
        let btnH = self.bounds.height
        
        var index = 0
        for subView in subviews {
            if subView.isKind(of: NSClassFromString("UITabBarButton")!) {
                subView.frame = CGRect(x: CGFloat(index) * btnW,
                                       y: 0,
                                       width: btnW,
                                       height: btnH)
                index += (index == 1) ? 2 : 1
            }
        }
        
        composeBtn.bounds.size = CGSize(width: btnW, height: btnH)
        composeBtn.center = CGPoint(x: self.center.x, y: self.bounds.height * 0.5)
    }
    
    
    //按钮的监听事件不希望外界可以访问 需要加private 限制外界访问
    //在swift中 默认给所有继承自 NSObject类的,实例对象的,非私有,方法或者属性默认添加 @objc
    //私有的方法实际上是没有 @objc这个标记
    //该标记是告诉系统该方法是对运行循环可见的
    //swift 2.0版本的时候 不加@objc 不会报错 但是在运行的时候 当用户点击的时候 程序会报 方法实例无法识别的错误
    @objc private func composeBtnDidClick() {
        //应该将用户的点击事件 抛给 控制器来处理
        //执行闭包
        composeClosure?()
    }
    

}
