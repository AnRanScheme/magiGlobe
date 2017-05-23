//
//  SMMImagePickerController.swift
//  Smm
//
//  Created by 安然 on 2017/5/17.
//  Copyright © 2017年 蔡杨振宇. All rights reserved.
//

import UIKit

class SMMImagePickerController: TZImagePickerController {
    
    // MARK: - 属性
    
    var alwaysEnableDoneButton: Bool = false
    
    var allowShowVideo: Bool = true
    
    var allowShowGif: Bool = true
    
    var allowShowOriginalPhoto: Bool = true
    
    var pictureWidth: CGFloat = 828
    
    var picturePreviewMaxWidth: CGFloat = 600
    
    // var didFinishShowPhotosHandle: ((_ photos: [UIImage]?, _ assets: [Any]?, _ isSelectOriginalPhoto: Bool)->Void)?
    
    // MARK: - 系统方法
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil,
                   bundle: nibBundleOrNil)
    }

    // 照片选择初始化
    override init(maxImagesCount: Int, columnNumber: Int, delegate: TZImagePickerControllerDelegate!, pushPhotoPickerVc: Bool) {
        super.init(maxImagesCount: maxImagesCount,
                   columnNumber: columnNumber,
                   delegate: delegate,
                   pushPhotoPickerVc: pushPhotoPickerVc)
    }
    
    // 照片浏览初始化
    override init(selectedAssets: NSMutableArray!, selectedPhotos: NSMutableArray!, index: Int) {
        super.init(selectedAssets: selectedAssets,
                                selectedPhotos: selectedPhotos,
                                index: index)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.alwaysEnableDoneBtn          = alwaysEnableDoneButton
        self.allowPickingVideo            = allowShowVideo
        self.allowPickingGif              = allowShowGif
        self.allowPickingOriginalPhoto    = allowShowOriginalPhoto
        self.photoWidth                   = pictureWidth
        self.photoPreviewMaxWidth         = picturePreviewMaxWidth
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - 自定义方法
    
    func didFinishShowPhotosHandle(handle: (((_ photos: [UIImage]?,
                                              _ assets: [Any]?,
                                              _ isSelectOriginalPhoto: Bool)->Void))?) {
        self.didFinishPickingPhotosHandle = handle
    }

}
