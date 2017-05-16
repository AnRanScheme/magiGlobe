//
//  AVPlayerItem+Man.swift
//  swift-magic
//
//  Created by 安然 on 17/2/15.
//  Copyright © 2017年 安然. All rights reserved.
//

import AVFoundation
public extension AVPlayerItem {

    public var m_bufferDuration: TimeInterval? {
        if  let first = self.loadedTimeRanges.first {
            let timeRange = first.timeRangeValue
            let startSeconds = CMTimeGetSeconds(timeRange.start)
            let durationSecound = CMTimeGetSeconds(timeRange.duration)
            let result = startSeconds + durationSecound
            return result
        }
        return nil
    }

    
    /// 获取／设置当前subtitle／cc
    public var m_selectedMediaCharacteristicLegibleOption:AVMediaSelectionOption?{
        get{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                return self.selectedMediaOption(in: legibleGroup)
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                self.select(newValue, in: legibleGroup)
            }
        }
    }

    /// 获取／设置当前cc
    public var m_selectedClosedCaptionOption:AVMediaSelectionOption?{
        get{
            if let option = self.m_selectedMediaCharacteristicLegibleOption{
                if option.mediaType == "clcp" {
                    return option
                }
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                if newValue == nil{
                    self.select(newValue, in: legibleGroup)
                }else if newValue!.mediaType == "clcp"{
                    self.select(newValue, in: legibleGroup)
                }
            }
        }
    }

    /// 获取／设置当前subtitle
    public var m_selectedSubtitleOption:AVMediaSelectionOption?{
        get{
            if let option = self.m_selectedMediaCharacteristicLegibleOption{
                if !option.hasMediaCharacteristic(AVMediaCharacteristicContainsOnlyForcedSubtitles) {
                    return option
                }
            }
            return nil
        }
        set{
            if let legibleGroup = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicLegible){
                if newValue == nil{
                    self.select(newValue, in: legibleGroup)
                }else if !newValue!.hasMediaCharacteristic(AVMediaCharacteristicContainsOnlyForcedSubtitles) {
                    self.select(newValue, in: legibleGroup)
                }
            }
        }
    }

    /// 获取／设置当前audio
    public var m_selectedMediaCharacteristicAudibleOption:AVMediaSelectionOption?{
        get{
            if let group = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicAudible){
                return self.selectedMediaOption(in: group)
            }
            return nil
        }
        set{
            if let group = self.asset.mediaSelectionGroup(forMediaCharacteristic: AVMediaCharacteristicAudible){
                self.select(newValue, in: group)
            }
        }
    }

}
