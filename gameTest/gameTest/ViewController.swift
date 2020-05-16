//
//  ViewController.swift
//  gameTest
//
//  Created by 尾原徳泰 on 2020/05/16.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var targetImageView: UIImageView!
    @IBOutlet var problemLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //スワイプ検知の関数
        setSwipeAction()
        moveImageView(direction: <#T##String#>)
    }
    //問題のリスト
    var list:[String] = ["上", "右", "下", "左"]
    
    func random() {
        var number = Int.random(in: 0...3)
        var text = list[number]
        problemLabel.text = text
    }
    
    //スワイプの方向の列挙体を作成
    enum swipeActionDirection: Int {
        case up = 0
        case right = 1
        case down = 2
        case left = 3
    }
    
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
    
    func moveImageView(direction:String) -> Int {
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
        //選んだ方向を格納する変数
        var selectDirection = 5

        switch direction {
        case "up":
            //imageviewを作成してスワイプされた方向にアニメーションさせる
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
                moveImageView.center.y -= 100
                selectDirection = swipeActionDirection.up.rawValue
            }) { (completed) in
                moveImageView.removeFromSuperview()
            }
        case "right":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x += 100
            selectDirection = swipeActionDirection.right.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            }
        case "down":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.y += 100
            selectDirection = swipeActionDirection.down.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            }
        case "left":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x -= 100
                selectDirection = swipeActionDirection.left.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            }
        default:
            return 6
        }
        
        return selectDirection
    }
    }

