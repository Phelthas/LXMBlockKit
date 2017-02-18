//
//  TestSwiftViewController.swift
//  LXMBlockKitDemo
//
//  Created by luxiaoming on 2017/2/16.
//  Copyright © 2017年 luxiaoming. All rights reserved.
//

import UIKit

class TestSwiftViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        let oneButton = UIButton()
        oneButton.addCallback { (sender) in
            
        }
        
        if let callback = oneButton.buttonCallback {
            callback(nil)
        }
        
        let oneItem = UIBarButtonItem(image: nil) { (item) in
            
        }
        if let callback = oneItem.itemCallback {
            callback(nil)
        }
        
        
        let oneGesture = UITapGestureRecognizer { (sender) in
            print("aaa")
        }
        self.view.addGestureRecognizer(oneGesture)
        if let callback = oneGesture.gestureCallback {
            callback(nil)
        }
        
        
        NotificationCenter.default.addObserver(self, name: Notification.Name.UIApplicationDidBecomeActive.rawValue) { (sender) in
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
