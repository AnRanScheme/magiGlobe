//
//  ARATabBarController.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

class ARATabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //将UITabBarController 的属性 tabBar替换成自定义的tabbar
        //只读属性不能够直接设置值 可以通过KVC间接的设置值
        let tabBar = ARAMainTabBar()

        self.setValue(tabBar, forKey: "tabBar")
        //添加子视图控制器
        addChildViewControllers()
        //修改默认的颜色
        //tabBar.tintColor = UIColor.orange
        
    }
    
    
    // MARK: - 自定义方法
    private func addChildViewControllers() {
        addChildViewController(vc: ARAHomeViewController(),
                               title: "首页",
                               imageName: "tabbar_home",
                               index: 0)
        addChildViewController(vc: ARAMessageViewController(),
                               title: "消息",
                               imageName: "tabbar_message_center",
                               index: 1)
        addChildViewController(vc: ARADiscoverViewController(),
                               title: "发现",
                               imageName: "tabbar_discover",
                               index: 2)
        addChildViewController(vc: ARAProfileViewController(),
                               title: "我",
                               imageName: "tabbar_profile",
                               index: 3)
    }
    
    private func addChildViewController(vc: UIViewController,title: String,imageName: String,index: Int) {
        //设置title
        vc.navigationItem.title = title
        //要同时设置title 和图片才可以显示
        vc.tabBarItem.title = title
        vc.tabBarItem.tag = index
        vc.tabBarItem.image = UIImage(named: imageName)
        //设置选中图片
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        //设置文字的颜色
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName : UIColor.orange], for: .selected)
        //vc.tabBarItem.imageInsets = UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
        //设置字体
        //vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName : UIFont.systemFont(ofSize: 11)], for: .normal)
        //设置偏移
        vc.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        //修改徽标的颜色
        if #available(iOS 10.0, *) {
            vc.tabBarItem.badgeColor = UIColor.purple
        } else {
            // Fallback on earlier versions
        }
        //不显示
        vc.tabBarItem.badgeValue = nil
        let nav = ARABaseNavigationController(rootViewController: vc)
        // addChildViewController: 如果在自定义tabBar 将tabBar上的tabBarButton隐藏 自己添加自定义按钮 并且还使用该方法 就会楚翔 自定义按钮无法点击, 使用 setViewControllers: animated: 就可以解决该问题
        addChildViewController(nav)
        
    }
    
    //当用户点击了UITabBarButton就会触发该事件
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        //确定用户点击了哪个tabbaItem
        print(item.tag)
        //遍历子视图
        var index = 0
        for subview in tabBar.subviews {
            if subview.isKind(of: NSClassFromString("UITabBarButton")!) {
                //获取到UITabBarButton
                if index == item.tag {
                    //就已经查找到了被点击的UITabBarButton
                    //遍历tabbarButton的子视图 判断类型是否是xxximageView
                    for target in subview.subviews {
                        if target.isKind(of: NSClassFromString("UITabBarSwappableImageView")!) {
                            //做动画
                            //修改transform
                            target.transform = CGAffineTransform.init(scaleX: 0.4, y: 0.4)
                            //在动画闭包中执行放大的操作
                            UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 5, options: [], animations: {
                                target.transform = CGAffineTransform.init(scaleX: 1, y: 1)
                            }, completion: { (_) in
                            })
                        }
                    }
                }
                index += 1
            }
        }
    }

}
