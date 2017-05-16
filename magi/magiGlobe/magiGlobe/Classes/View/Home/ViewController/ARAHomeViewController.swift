//
//  ARAHomeViewController.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

class ARAHomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tv = UITableView(frame: self.view.bounds, style: .grouped)
        tv.delegate = self
        tv.dataSource = self
        return tv
    }()
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "请输入你搜索的内容"
        search.showsCancelButton = true
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
        view.addSubview(tableView)
        searchBar.m_size = CGSize(width: 300, height: 44)
        searchBar.m_centerX = tableView.m_centerX
        searchBar.m_top = tableView.m_top
        tableView.addSubview(searchBar)
        tableView.sectionHeaderHeight = 0
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellID")
        //tableView.contentInset = UIEdgeInsetsMake(searchBar.m_height, 0, 0, 0)
    }
    
    func setupNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose, target: self, action: #selector(appinfosViewController))
    }
    
    func appinfosViewController() {
        // TODO: 注意当跳转到下一个页面时,就不要用懒加载了
        let appInfosViewController = ARAAppInfosViewController()
        // FIXME: 修改完成
        navigationController?.pushViewController(appInfosViewController, animated: true)
    }
    
}



extension ARAHomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellID")
        cell?.textLabel?.text = "安然 -- \(indexPath.row)"
        return cell!
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .none
    }
    
}

extension ARAHomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("搜所")
        searchBar.text = ""
        view.endEditing(true)
    }
    
}
