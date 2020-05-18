//
//  GameViewController.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    //各クラスのインスタンスを作成しておく
    let game = Gamge()
    let countTimer = CountTimer()
    let swipeAction = SwipeAction()
    let record = Record()
    let image = Image()
    let alert = Alert()
    
    //スワイプを検知するゾーン
    @IBOutlet weak var swipeImageView: UIImageView!
    //問題表示ゾーン
    @IBOutlet weak var problemImageView: UIImageView!
    //残り時間表示ラベル
    @IBOutlet weak var timeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //ゲーム開始のアラートを出す
        alert.upStartAlert()
        //スワイプの検知実装
        swipeAction.setSwipeAction(targetImageView: swipeImageView)
    }
    //ゲームの開始
    func doGame() {
        //タイマー開始
        var time = countTimer.startTimer()
        //残り時間を保持
        let lastTime = countTimer.doTimer(setTime: 60)
        //ゲームの動きだし
        var directionNumber = swipeAction.setSwipeAction(targetImageView: swipeImageView)
        //正誤判定
        var judge = game.judge(selectDirection: directionNumber)
        //問題に表示するイメージを設定
    
        let view = game.DisplayView() as! UIImage
        }
        //操作
        
    }
    //ゲームのカウント
    
    //ゲームの終了のアラートを出す
    
    

    


}
