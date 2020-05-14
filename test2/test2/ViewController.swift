//
//  ViewController.swift
//  test2
//
//  Created by 尾原徳泰 on 2020/05/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //感知する方向を配列に入れる
        let derectionList:[UISwipeGestureRecognizer.Direction] = [.up, .down, .right, .left]
       
        let swipeRecognizer1 = UISwipeGestureRecognizer(target: self, action: #selector(swipeLabel(sender:)))
        swipeRecognizer1.direction = .up
        //これをしないとエラー出ないけど反応しない
        animationView.isUserInteractionEnabled = true
        //uiimageにスワイプの感知を追加
        animationView.addGestureRecognizer(swipeRecognizer1)
            
        }
    

    
    @IBOutlet weak var animationView: UIImageView!
    //スワイプされたときに動く関数
    @objc func swipeLabel(sender:UISwipeGestureRecognizer) {
        testLabel.text = "上"
        print("up")

        }
        
}
    


