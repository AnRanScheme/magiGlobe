//
//  ARAMessageViewController.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit

class ARAMessageViewController: UIViewController, TZImagePickerControllerDelegate {
    
    // MARK: - 控件
    
    lazy var searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "请输入你搜索的内容"
        search.searchBarStyle = .minimal
        search.delegate = self
        return search
    }()
    
    lazy var actionButton:UIButton = { [weak self] in
        let btn = UIButton()
        btn.addTarget(self,
                      action: #selector(ARAMessageViewController.persentPhotoPickerView),
                      for: .touchUpInside)
        btn.setTitle("相册选择图片",
                     for: .normal)
        btn.setTitleColor(UIColor.red,
                          for: .normal)
        btn.sizeToFit()
        return btn
    }()
    
    
    // MARK: - 属性
    
    var selectedPhotos: [UIImage]?
    
    var selectedAssets: [Any]?
    
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
        view.addSubview(actionButton)
        actionButton.m_alignCenter()
    }
    
    func setupNav() {
        navigationItem.titleView = searchBar
    }
    
    @objc private func persentPhotoPickerView() {
        let pickerView = SMMImagePickerController(maxImagesCount: 9,
                                                  columnNumber: 4,
                                                  delegate: self,
                                                  pushPhotoPickerVc: true)
        pickerView.didFinishShowPhotosHandle { (photos, assets, isSelectOriginalPhoto) in
            if let array1 = photos,
                let array2 = assets {
                self.selectedPhotos = array1
                self.selectedAssets = array2
                print("self.selectedPhotos-------\(String(describing: self.selectedPhotos?.count))")
                print("self.selectedAssets-------\(String(describing: self.selectedAssets?.count))")
            }
        }
        navigationController?.present(pickerView,
                                      animated: true,
                                      completion: nil)
    }
    
    // 收回键盘
    func viewTapped() {
        view.endEditing(true)
    }
    

}

extension ARAMessageViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

    }
    
}

