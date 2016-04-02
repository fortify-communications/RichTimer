//
//  ViewController.swift
//  RichTimer
//
//  Created by Pilipenko Dima on 04/01/2016.
//  Copyright (c) 2016 Pilipenko Dima. All rights reserved.
//

import UIKit
import RichTimer

class ViewController: UIViewController {
    private var _timer: NSTimer?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // once without parameters
        NSTimer.once(1) {
            print("I have fired after 1 second")
        }
        
        // once with parameters
        NSTimer.once(3, arguments: (magicNumber: 4, text: "Passed text to closure")) { delay, text in
            print("I have magic number: \(magicNumber) and received this: \(text)")
        }
        
        // every without parameters
        NSTimer.every(10) {
            print("I'm here for forever, visit every 10 second")
        }
        
        // every with parameters and func
        var count = 0
        var timer: NSTimer!
        
        func didFiredTimer(repeatCount: Int) {
            count += 1
            if count == repeatCount {
                print("Timer will be invalidated!")
                timer.invalidate()
            }
        }
        
        timer = NSTimer.every(2, arguments: 4, completion: didFiredTimer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}