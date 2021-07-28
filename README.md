# EDSlideMenu

[![CI Status](http://img.shields.io/travis/eneadume@gmail.com/EDSlideMenu.svg?style=flat)](https://travis-ci.org/eneadume@gmail.com/EDSlideMenu)
[![Version](https://img.shields.io/cocoapods/v/EDSlideMenu.svg?style=flat)](http://cocoapods.org/pods/EDSlideMenu)
[![License](https://img.shields.io/cocoapods/l/EDSlideMenu.svg?style=flat)](http://cocoapods.org/pods/EDSlideMenu)
[![Platform](https://img.shields.io/cocoapods/p/EDSlideMenu.svg?style=flat)](http://cocoapods.org/pods/EDSlideMenu)

[Change Log] (CHANGELOG.md)
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.
To use this pod in your project follow the example: 

      override func viewDidLoad() {
        super.viewDidLoad()
        let frameworkBundle = Bundle(identifier: "org.cocoapods.EDSlideMenu")//This is the bundle of my framework
        //baseView is the view that you want to load the SlideMenu. it is the view that you create in your storyboard
        var myMenu :CustomDrawerMenu = UIView.createView(attachTo : self.baseView, fromBundle : frameworkBundle)
      }


## Requirements

## Installation

EDSlideMenu is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "EDSlideMenu"
```

## Author

Enea Dume, eneadume@gmail.com

## License

EDSlideMenu is available under the MIT license. See the LICENSE file for more info.
