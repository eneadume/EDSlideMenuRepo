//
//  ViewController.swift
//  EDSlideMenu
//
//  Created by eneadume@gmail.com on 06/21/2017.
//  Copyright (c) 2017 eneadume@gmail.com. All rights reserved.
//

import UIKit
import EDSlideMenu
class ViewController: UIViewController {
    @IBOutlet var baseView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        let frameworkBundle = Bundle(identifier: "org.cocoapods.EDSlideMenu")
        var _ :CustomDrawerMenu = UIView.createView(attachTo : self.baseView, fromBundle : frameworkBundle)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

