//
//  ARAMessageViewController.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

class ARAMessageViewController: UIViewController {
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "请输入你搜索的内容"
        search.searchBarStyle = .minimal
        search.delegate = self
        return search
    }()
    
    // MARK: - System function

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNav()
        setupUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    // MARK: - Definite function
    
    func setupUI() {
        let slider = UISlider(frame: CGRect(x: 0, y: 400, width: 300, height: 20))
        view.addSubview(slider)
    }
    
    func setupNav() {
        navigationItem.titleView = searchBar
    }
    
    /// 收回键盘
    func viewTapped() {
        view.endEditing(true)
    }
    

}

extension ARAMessageViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    
}
