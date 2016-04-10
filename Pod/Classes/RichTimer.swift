//
//  RichTimer.swift
//  Pods
//
//  Created by Pilipenko Dima on 4/1/16.
//
//

import Foundation

public extension NSTimer {
    class func once(value: NSTimeInterval, completion: () -> Void) -> NSTimer {
        return initTimer(value, userInfo: VoidBox(nilCompletion: completion), repeats: false)
    }
    
    class func every(value: NSTimeInterval, completion: () -> Void) -> NSTimer {
        return initTimer(value, userInfo: VoidBox(nilCompletion: completion), repeats: true)
    }
    
    class func once<T>(value: NSTimeInterval, arguments: T, completion: T -> Void) -> NSTimer {
        return initTimer(value, userInfo: Box(arguments, completion: completion), repeats: false)
    }
    
    class func every<T>(value: NSTimeInterval, arguments: T, completion: T -> Void) -> NSTimer {
        return initTimer(value, userInfo: Box(arguments, completion: completion), repeats: true)
    }
    
    class func timerDidFired(timer: NSTimer) {
        let box = timer.userInfo! as! Boxable
        box.lookInside()
    }
    
    private class func initTimer(ti: NSTimeInterval, userInfo: AnyObject, repeats: Bool = false) -> NSTimer {
        return NSTimer.scheduledTimerWithTimeInterval(ti, target: self, selector: #selector(timerDidFired(_:)), userInfo: userInfo, repeats: repeats)
    }
}

private class VoidBox: Boxable {
    typealias CompletionType = () -> Void
    
    private var _completion: CompletionType!
    
    init(nilCompletion completion: CompletionType) {
        self._completion = completion
    }
    
    func lookInside() {
        _completion()
    }
    
    deinit {
        _completion = nil
    }
}

private class Box<T>: Boxable {
    typealias CompletionType = T -> Void
    
    private var _arguments: T!
    private var _completion: CompletionType!
    
    init(_ arguments: T!, completion: CompletionType) {
        self._arguments = arguments
        self._completion = completion
    }
    
    func lookInside() {
        _completion(_arguments)
    }
    
    deinit {
        _arguments = nil
        _completion = nil
    }
}

private protocol Boxable {
    func lookInside()
}