//
//  ViewController.swift
//  test2
//
//  Created by 尾原徳泰 on 2020/05/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //感知する方向を配列に入れる
        let derectionList:[UISwipeGestureRecognizer.Direction] = [.up, .down, .right, .left]
        
        for direction in derectionList {
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: Selector(swipeLabel))
            swipeRecognizer.direction = direction
            //uiimageにスワイプの感知を追加
            animationView.addGestureRecognizer(swipeRecognizer)
            
        }
    }

    
    @IBOutlet weak var animationView: UIImageView!
    
    func swipeLabel(sender:UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.up:
            testLabel.text = "上"; print("up")
        case UISwipeGestureRecognizer.Direction.down:
            testLabel.text = "下"; print("down")
        case UISwipeGestureRecognizer.Direction.right:
            testLabel.text = "右"; print("right")
        case UISwipeGestureRecognizer.Direction.left:
            testLabel.text = "左"; print("left")
        default:
            return
        }
        
    }
    
}

