//
//  ViewController.swift
//  timerTest
//
//  Created by 尾原徳泰 on 2020/05/19.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    //インスタンス作成
    var timer = CountTimer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func timerActionButton(_ sender: Any) {
    }
    
}

