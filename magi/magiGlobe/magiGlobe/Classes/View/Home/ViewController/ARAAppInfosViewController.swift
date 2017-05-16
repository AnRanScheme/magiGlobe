//
//  ARAAppInfosViewController.swift
//  swift-magic
//
//  Created by 安然 on 17/2/22.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

let appInfosViewControllerCellReuseIdentifier = "ARAAppInfosViewControllerCellReuseIdentifier"

class ARAAppInfosViewController: UITableViewController {
    
    lazy var dataArray: [String] = [String]()
    
    lazy var nameDataArray: [String] = [String]()
    
    // MARK: - System function

    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupUI()
        setupNav()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Definite function
    
    func setupUI() {
        //tableView.register(UITableViewCell.self, forCellReuseIdentifier: appInfosViewControllerCellReuseIdentifier)
        tableView.m_removeTableHeaderView()
        tableView.m_removeTableFooterView()
    }
    
    func setupNav() {
        navigationController?.title = "appInfos"
    }
    
    func loadData() {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1.5)
            self.nameDataArray.append("app's 名字")
            self.nameDataArray.append("app's 发布版本号")
            self.nameDataArray.append("app's 内部版本号")
            self.nameDataArray.append("app's Identifier")
            self.nameDataArray.append("app's 格式的版本信息")
            self.nameDataArray.append("app's device version")
            self.nameDataArray.append("app's 运营商")
            self.dataArray.append(AppInfos.appDisplayName ?? "")
            self.dataArray.append(AppInfos.appVersion ?? "")
            self.dataArray.append(AppInfos.appBuild ?? "")
            self.dataArray.append(AppInfos.identifier ?? "")
            self.dataArray.append(AppInfos.targetedVersion ?? "")
            self.dataArray.append(AppInfos.deviceVersion)
            self.dataArray.append(AppInfos.carrierName ?? "运营商缺失")
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    deinit {
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: appInfosViewControllerCellReuseIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                         reuseIdentifier: appInfosViewControllerCellReuseIdentifier)
        }
        cell?.textLabel?.text         =    nameDataArray[indexPath.row]
        cell?.detailTextLabel?.text   =    dataArray[indexPath.row]
        return cell!
    }
    
    // MARK: - Table view delegate

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
