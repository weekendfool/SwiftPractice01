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
    
    @IBAction func action(_ sender: Any) {
        /*
        self.animationView.center = CGPoint(x: 200, y: 446)
        UIView.animate(withDuration: 1.0, delay: 0.0, options: .allowUserInteraction, animations: {
            self.animationView.center.y += 100
            
        }, completion: nil)
 */
        let image = makeView()
        viewAnimateion(moveImageView: image)
//        image.removeFromSuperview()
    }
    
    
    @IBOutlet weak var animationView: UIImageView!
    //スワイプされたときに動く関数
    @objc func swipeLabel(sender:UISwipeGestureRecognizer) {
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.up:
            testLabel.text = "上"; makeView()
        case UISwipeGestureRecognizer.Direction.right:
            testLabel.text = "右"; makeView()
        case UISwipeGestureRecognizer.Direction.down:
            testLabel.text = "下"; makeView()
        case UISwipeGestureRecognizer.Direction.left:
            testLabel.text = "左"; makeView()
        default:
            return
        }

        }
        
    func makeView() -> UIImageView {
        //UIImageのインスタンス作成
        let moveImage:UIImage = UIImage(named: "same2")!
        //UIImageViewの初期化とmoveImageの代入
        let moveImageView = UIImageView(image: moveImage)
        //画像のサイズを設定
        let rect:CGRect = CGRect(x: 119, y: 393, width: 110, height: 110)
        moveImageView.frame = rect
        //インスタンスをviewに追加
        self.view.addSubview(moveImageView)
        
        return moveImageView

    }
    
    func viewAnimateion(moveImageView:UIImageView) {
        moveImageView.center = CGPoint(x: 200, y: 446)

        UIView.animate(withDuration: 1.0, delay: 0.0, options: .allowAnimatedContent, animations: {
            moveImageView.center.y += 100
            
        }) { (completed) in
            moveImageView.removeFromSuperview()
        }
        }
        
    
}
    


