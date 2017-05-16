//
//  String+JSON.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import Foundation


public extension String {
    //
    public func m_JSONObject() -> Any? {
        guard let data = self.data(using: String.Encoding.utf8) else{
            return nil
        }
        
        do {
            let object = try JSONSerialization.jsonObject(with: data, options: [.mutableContainers,.mutableLeaves])
            return object
        } catch let aError as NSError {
            print(aError)
            return nil
        }
    }
    
}
