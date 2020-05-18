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
    var num = 6
    var testText = 7
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //初期化
        problemLabel.text = ""
        random()
        setSwipeAction()
//        doGame()
        finish(score: score)
        
    }
    //問題のリスト
    var list:[String] = ["上", "右", "下", "左"]
    
    func random() {
        let number = Int.random(in: 0...3)
        let text = list[number]
        print(text)
        
        problemLabel.text = text
        switch text {
               case "上":
                   testText = swipeActionDirection.up.rawValue
               case "右":
                   testText = swipeActionDirection.right.rawValue
               case "下":
                   testText = swipeActionDirection.down.rawValue
               case "左":
                   testText = swipeActionDirection.left.rawValue
               default:
                   return
               }
        print(testText)
    }
    /*
    //回数制限
    func doGame() -> Int{
        let text = random()
        print("==========")
        print(text)
        switch text {
        case "上":
            testText = swipeActionDirection.up.rawValue
        case "右":
            testText = swipeActionDirection.right.rawValue
        case "下":
            testText = swipeActionDirection.down.rawValue
        case "左":
            testText = swipeActionDirection.left.rawValue
        default:
            return 6
        }
        setSwipeAction()
        return testText
    }
 */
    func judge() {
        print("判定実行")
        if testText == num {
            score += 1
            print(score)
        } else {
            print("no")
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
            moveImageView(direction: "up"); print("up"); self.num = swipeActionDirection.up.rawValue
        case UISwipeGestureRecognizer.Direction.right:
            moveImageView(direction: "right"); print("right"); self.num = swipeActionDirection.right.rawValue
        case UISwipeGestureRecognizer.Direction.down:
            moveImageView(direction: "down"); print("down"); self.num = swipeActionDirection.down.rawValue
        case UISwipeGestureRecognizer.Direction.left:
            moveImageView(direction: "left"); print("left"); self.num = swipeActionDirection.left.rawValue
        default:
            return
        }
        self.judge()
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
//                self.num = swipeActionDirection.up.rawValue
                self.random()
//                self.judge()
                self.finish(score: self.score)
            }
        case "right":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x += 200
            selectDirection = swipeActionDirection.right.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            self.flag = true
//            self.num = swipeActionDirection.right.rawValue
                self.random()
//                self.judge()
                self.finish(score: self.score)
            }
        case "down":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.y += 200
            selectDirection = swipeActionDirection.down.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            self.flag = true
//            self.num = swipeActionDirection.down.rawValue
                self.random()
//            self.judge()
            self.finish(score: self.score)
            }
        case "left":
            UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseIn, animations: {
            moveImageView.center.x -= 200
            selectDirection = swipeActionDirection.left.rawValue
            }) { (completed) in
            moveImageView.removeFromSuperview()
            self.flag = true
//            self.num = swipeActionDirection.left.rawValue
                self.random()
//                self.judge()
                self.finish(score: self.score)
            }
        default:
            return 6
        }
        
        return selectDirection
    }
    
    func finish(score:Int) {
        if score == 10{
            //アラートのインスタンス生成
            let alertController: UIAlertController
            //アラートの基本骨子作成
            alertController = UIAlertController(title: "ゲーム終了", message: "10問正解", preferredStyle: .alert)
            //アラートのアクションを追加
            let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            //アクションを追加
            alertController.addAction(alertAction)
            //アラートを表示
            present(alertController, animated: true)
        }
    }
    }

