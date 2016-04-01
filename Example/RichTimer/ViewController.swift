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
        
        NSTimer.once(1) {
            print("custom text")
        }
        
        NSTimer.once(2, arguments: (text: "amount of characters", doesItWorks: true)) { value in
            print("\(value.text) is here? \(value.doesItWorks)")
        }
        
        var count = 0
        _timer = NSTimer.each(3, arguments: 5) {[weak self] value in
            print("repeated value:\(value)")
            
            count += 1
            if count > 2 {
                self?._timer!.invalidate()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

