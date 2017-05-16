//
//  ARALabel.swift
//  swift-magic
//
//  Created by 安然 on 17/2/22.
//  Copyright © 2017年 安然. All rights reserved.
//

import UIKit
import CoreText

let kRegexHighlightViewTypeURL     = "url"
let kRegexHighlightViewTypeAccount = "account"
let kRegexHighlightViewTypeTopic   = "topic"
let kRegexHighlightViewTypeEmoji   = "emoji"

let URLRegular      = "(http|https)://(t.cn/|weibo.com/)+(([a-zA-Z0-9/])*)"
let EmojiRegular    = "(\\[\\w+\\])"
//let AccountRegular  = "@[\u4e00-\u9fa5a-zA-Z0-9_-]{2,30}"
let TopicRegular    = "#[^#]+#"

class ARALabel: UIView {

    var text: String?
    
    var textColor: UIColor?
    
    var font: UIFont?
    
    var lineSpace: NSInteger?
    
    var textAlignment: NSTextAlignment?
    
    
    
    /*
     UIImageView *labelImageView;
     UIImageView *highlightImageView;
     BOOL highlighting;
     BOOL btnLoaded;
     BOOL emojiLoaded;
     NSRange currentRange;
     NSMutableDictionary *highlightColors;
     NSMutableDictionary *framesDict;
     NSInteger drawFlag;
     */
    private var labelImageView: UIImageView?
    
    private var highlightImageView: UIImageView?
    
    private var highlighting: Bool?
    
    private var btnLoaded: Bool?
    
    private var emojiLoaded: Bool?
    
    private var currentRange: NSRange?
    
    private var highlightColors: NSMutableDictionary?
    
    private var framesDict: NSMutableDictionary?
    
    private var drawFlag: UInt32?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        drawFlag        = arc4random()
        framesDict      = NSMutableDictionary()
    
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
