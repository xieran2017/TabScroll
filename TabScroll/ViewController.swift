//
//  ViewController.swift
//  TabScroll
//
//  Created by xieran on 2018/3/26.
//  Copyright © 2018年 xieran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tabScroll = TabScroll(frame: CGRect(x: 0, y: 100, width: view.frame.width, height: 100))
        tabScroll.titles = ["1000","2000","3000","4000","5000","6000","7000"]
        view.addSubview(tabScroll)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for v in view.subviews {
            if v is TabScroll {
                (v as! TabScroll).selectedIndex = 0
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

