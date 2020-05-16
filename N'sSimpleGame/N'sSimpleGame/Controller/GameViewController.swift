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

    override func viewDidLoad() {
        super.viewDidLoad()
        //ゲーム開始のアラートを出す
        game.upStartAlert()
        //スワイプの検知実装
        swipeAction.setSwipeAction()
    }
    //ゲームの開始
    func doGame() {
        //タイマー開始
        var time = countTimer.startTimer()
        //残り時間を保持
        let lastTime = countTimer.doTimer(setTime: 60)
        //ゲームの動きだし
        while 0 <= lastTime {
            //正誤判定
            var judge = game.judge(selectDirection: <#T##Int#>)
            //問題に表示するイメージを設定
            if judge
            let view = game.DisplayView() as! UIImage
        }
        //操作
        
    }
    //ゲームのカウント
    //ゲームの終了のアラートを出す

    


}
