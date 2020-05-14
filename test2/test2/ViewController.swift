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
       
        for direction in derectionList {
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeLabel(sender:)))
            swipeRecognizer.direction = direction
            //これをしないとエラー出ないけど反応しない
            animationView.isUserInteractionEnabled = true
            //uiimageにスワイプの感知を追加
            animationView.addGestureRecognizer(swipeRecognizer)
        }
        }
    

    
    @IBOutlet weak var animationView: UIImageView!
    //スワイプされたときに動く関数
    @objc func swipeLabel(sender:UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.up:
            testLabel.text = "上"
        case UISwipeGestureRecognizer.Direction.right:
            testLabel.text = "右"
        case UISwipeGestureRecognizer.Direction.down:
            testLabel.text = "下"
        case UISwipeGestureRecognizer.Direction.left:
            testLabel.text = "左"
        default:
            return
        }

        }
        
}
    


