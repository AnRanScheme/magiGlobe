//
//  NSDate+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import Foundation

public extension Date {
    
    /// 格式化时间
    ///
    /// - Parameters:
    ///   - formatString: 格式符
    ///   - timezoneAbbr: The abbreviation for the time zone.
    ///   - localeIdentifier: the specified identifier.
    /// - Returns: 格式化的字符串
    public func m_toDateString(formatString: String,timezoneAbbr: String,localeIdentifier:String) -> String{
        return m_toDasteString(formatString: formatString, timezone: TimeZone(abbreviation: timezoneAbbr)!, localeIdentifier: localeIdentifier)
    }
    
    
    /// 格式化时间
    ///
    /// - Parameters:
    ///   - formatString: 格式符
    ///   - timezone: 时区
    ///   - localeIdentifier: the specified identifier.
    /// - Returns: 格式化的字符串
    public func m_toDasteString(formatString: String,timezone: TimeZone,localeIdentifier:String) -> String{
        let dataFormat = DateFormatter()
        dataFormat.locale = Locale(identifier: localeIdentifier)
        dataFormat.timeZone = timezone
        dataFormat.dateFormat = formatString
        return dataFormat.string(from: self)
    }
    
}
