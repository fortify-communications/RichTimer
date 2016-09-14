//
//  RichTimer.swift
//  Pods
//
//  Created by Andrei Odeski on 4/1/16.
//
//

import Foundation

public extension Timer
{
    class func once(value: TimeInterval, completion: @escaping () -> Void) -> Timer {
        return initTimer(ti: value, userInfo: VoidBox(nilCompletion: completion), repeats: false)
    }
    
    class func every(value: TimeInterval, completion: @escaping () -> Void) -> Timer {
        return initTimer(ti: value, userInfo: VoidBox(nilCompletion: completion), repeats: true)
    }
    
    class func once<T>(value: TimeInterval, arguments: T, completion: @escaping (T) -> Void) -> Timer
    {
        return initTimer(ti: value, userInfo: Box(arguments, completion: completion), repeats: false)
    }
    
    class func every<T>(value: TimeInterval, arguments: T, completion: @escaping (T) -> Void) -> Timer {
        return initTimer(ti: value, userInfo: Box(arguments, completion: completion), repeats: true)
    }
    
    class func timerDidFire(_ timer: Timer?)
    {
        if let t = timer as Timer?
        {
            let box = t.userInfo! as! Boxable
            box.lookInside()
        }
    }
    
    class func initTimer(ti: TimeInterval, userInfo: AnyObject, repeats: Bool = false) -> Timer
    {
        return Timer.scheduledTimer(timeInterval: ti, target: self, selector: #selector(self.timerDidFire(_ :)), userInfo: userInfo, repeats: repeats)
    }
}


private class VoidBox: Boxable
{
    typealias CompletionType = () -> Void
    
    private var _completion: CompletionType!
    
    init(nilCompletion completion: @escaping CompletionType) {
        self._completion = completion
    }
    
    func lookInside() {
        _completion()
    }
    
    deinit {
        _completion = nil
    }
}


private class Box<T>: Boxable
{
    typealias CompletionType = (T) -> Void
    
    private var _arguments: T!
    private var _completion: CompletionType!
    
    init(_ arguments: T!, completion: @escaping CompletionType) {
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
