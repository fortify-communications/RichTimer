# RichTimer

[![CI Status](http://img.shields.io/travis/dimpiax/RichTimer.svg?style=flat)](https://travis-ci.org/dimpiax/RichTimer)
[![Version](https://img.shields.io/cocoapods/v/RichTimer.svg?style=flat)](http://cocoapods.org/pods/RichTimer)
[![License](https://img.shields.io/cocoapods/l/RichTimer.svg?style=flat)](http://cocoapods.org/pods/RichTimer)
[![Platform](https://img.shields.io/cocoapods/p/RichTimer.svg?style=flat)](http://cocoapods.org/pods/RichTimer)

RichTimer – it's easy NSTimer managment and compact visual appearance.
Accepts generic parameters for common functions

## Usage


To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

## Requirements

## Installation

RichTimer is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "RichTimer"
```

## Author

Pilipenko Dima, dimpiax@gmail.com

## License

RichTimer is available under the MIT license. See the LICENSE file for more info.
