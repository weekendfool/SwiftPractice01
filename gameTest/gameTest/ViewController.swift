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
    @IBOutlet weak var problemLabel: UILabel!
    
    var flag = true
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期化
        problemLabel.text = ""
        //スワイプ検知の関数
        setSwipeAction()
       
 
        doGame()
        
        
    }
    //問題のリスト
    var list:[String] = ["上", "右", "下", "左"]
    
    func random() {
        let number = Int.random(in: 0...3)
        let text = list[number]
        print(text)
        problemLabel.text = text
    }
    //回数制限
    func doGame() {
        var num = 0
        print("3##########3")
        while num <= 10 {
            print("1!!!!!!!!!!!!!!!!!!!")
            if flag == true {
                random()
                num += 1
            } else {
                print("$$$$$$")
            }
        }
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
            targetImageView.isUserInteractionEnabled = true
            targetImageView.addGestureRecognizer(swipeRecognizer)
        }
    
    }
    @objc func swipeAndAnimation(sender:UISwipeGestureRecognizer) {
        //sender.directionの値に応じて条件分岐
        switch sender.direction {
        case UISwipeGestureRecognizer.Direction.up:
            moveImageView(direction: "up"); print("up")
        case UISwipeGestureRecognizer.Direction.right:
            moveImageView(direction: "right"); print("right")
        case UISwipeGestureRecognizer.Direction.down:
            moveImageView(direction: "down"); print("down")
        case UISwipeGestureRecognizer.Direction.left:
            moveImageView(direction: "left"); print("left")
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
                moveImageView.center.y -= 200
                selectDirection = swipeActionDirection.up.rawValue
            }) { (completed) in
                moveImageView.removeFromSuperview()
                self.flag = true
            }
        case "right":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x += 200
            selectDirection = swipeActionDirection.right.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            self.flag = true
            }
        case "down":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.y += 200
            selectDirection = swipeActionDirection.down.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            self.flag = true
            }
        case "left":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x -= 200
            selectDirection = swipeActionDirection.left.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            self.flag = true
            }
        default:
            return 6
        }
        
        return selectDirection
    }
    }

