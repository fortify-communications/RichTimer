//
//  RichTimer.swift
//  Pods
//
//  Created by Pilipenko Dima on 4/1/16.
//
//

import Foundation

public extension NSTimer {
    public class func scheduledTimerWithTimeInterval(ti: NSTimeInterval, target aTarget: AnyObject, selector aSelector: Selector) -> NSTimer {
        return scheduledTimerWithTimeInterval(ti, target: aTarget, selector: aSelector, userInfo: nil, repeats: false)
    }
    
    class func delay(ti value: NSTimeInterval) -> NSTimer {
        return scheduledTimerWithTimeInterval(value, target: self, selector: #selector(a(_:)))
    }
    
    class func a(timer: NSTimer) {
        print("whoop!")
    }
}