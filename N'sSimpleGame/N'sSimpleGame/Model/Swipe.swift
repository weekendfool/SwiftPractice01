//
//  Swipe.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class SwipeAction: UIViewController {
    //スワイプアクション用のスワイプリコグナイザーを作る
    
    //四方向のスワイプ検知の実装
    func setSwipeAction() {
        //スワイプを検知できる方向を四方に設定するためのリスト
        let directionList:[UISwipeGestureRecognizer.Direction] = [.up, .right, .down, .left]
        for direction in directionList {
            //スワイプアクションのインスタンス作成
            let swipeRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(swipeAndAnimation(sender:)))
            swipeRecognizer.direction = direction
        }
    
    }
    @objc func swipeAndAnimation(sender:UISwipeGestureRecognizer) {
        //sender.directionの値に応じて条件分岐
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.up:
            moveImageView(direction: "up")
        case UISwipeGestureRecognizer.Direction.right:
            moveImageView(direction: "right")
        case UISwipeGestureRecognizer.Direction.down:
            moveImageView(direction: "down")
        case UISwipeGestureRecognizer.Direction.left:
            moveImageView(direction: "leht")
        default:
            return
        }
    }
    
    func moveImageView(direction:String) {
        //UIImageのインスタンス作成
        let moveImage:UIImage = UIImage(named: "onlyHead")!
        //UIImageViewの初期化とmoveImageの代入
        let moveImageView = UIImageView(image: moveImage)
        //画像のサイズを設定
        let rect:CGRect = CGRect(x: 119, y: 393, width: 65, height: 65)
        moveImageView.frame = rect
        //インスタンスをviewに追加
        view.addSubview(moveImageView)
        
        moveImageView.center = CGPoint(x: 200, y: 446)

        switch direction {
        case "up":
            //imageviewを作成してスワイプされた方向にアニメーションさせる
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                moveImageView.center.y -= 100
            }) { (completed) in
                moveImageView.removeFromSuperview()
            }
        case "right":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x += 100
            }) { (completed) in
            moveImageView.removeFromSuperview()
            }
        case "down":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.y += 100
            }) { (completed) in
            moveImageView.removeFromSuperview()
            }
        case "left":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x -= 100
            }) { (completed) in
            moveImageView.removeFromSuperview()
            }
        default:
            return
        }
    }
    
}
