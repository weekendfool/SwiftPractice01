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
        timer.startTimer()
//        let text = timer.doTimer(setTime: 5)
//        timerLabel.text = "\(text)"
//            timer.stopTimer(remainingTime: text)
        
    }

    @IBAction func timerActionButton(_ sender: Any) {
        //タイマーの実行
        
        let text = timer.doTimer(setTime: 5)
            timerLabel.text = "\(text)"
        print("&&&&&&&&&&&&&&&&&&&&&6")
        
    }
    
}

