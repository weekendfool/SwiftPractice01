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
    
    var directionNumber: Any = ""
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
        directionNumber = swipeAction.setSwipeAction(targetImageView: swipeImageView)
        countTimer.startTimer()
        countTimer.doTimer(setTime: 60)
        viewTimerLabel()
//        doGame()
    }
    //ゲームの開始
    func doGame() {
        let startFlag = game.startGame().startFlag
        let numberOfCorrectAnswers = game.startGame().numberOfCorrectAnswers
        let numberOfIncorrectAnswers = game.startGame().numberOfIncorrectAnswers
        //タイマー開始
        var time = countTimer.startTimer()
        //残り時間を保持
        let lastTime = countTimer.doTimer(setTime: 60)
        //残り時間の表示
        timeLabel.text = "残り時間\(lastTime)秒"
        //ゲームの動きだし
        //問題に表示するイメージを設定
        let view = game.DisplayView() as! UIImage
        //正誤判定
        let judge = game.judge(selectDirection: directionNumber)
        //得点カウント
        var gameNumberOfCorrectAnswers = game.countUp(judgeFlag: judge, InputNumberOfCorrectAnswers: numberOfCorrectAnswers, InputNumberOfIncorrectAnswers: numberOfIncorrectAnswers, startFlag: startFlag).numberOfCorrectAnswers
        var gameNumberOfIncorrectAnswers = game.countUp(judgeFlag: judge, InputNumberOfCorrectAnswers: numberOfCorrectAnswers, InputNumberOfIncorrectAnswers: numberOfIncorrectAnswers, startFlag: startFlag).numberOfIncorrectAnswers
        //終了動作
        let count = countTimer.stopTimer(remainingTime: lastTime)
        if count {
            let finishScore = game.finishGame(numberOfCorrectAnswers: gameNumberOfCorrectAnswers, numberOfIncorrectAnswers: gameNumberOfIncorrectAnswers)
            alert.upFinishAlert(intScore: finishScore)
        }
        
        }
        
        
    
    //ゲームのカウント
    func viewTimerLabel() {
        //タイマー開始
        var time = countTimer.startTimer()
        //残り時間を保持
        let lastTime = countTimer.doTimer(setTime: 60)
        //残り時間の表示
        timeLabel.text = "残り時間\(lastTime)秒"
        //ゲームの動きだし
        //問題に表示するイメージを設定
        let view = game.DisplayView() as! UIImage
    }
    
    //ゲームの終了のアラートを出す
    
    

    


}
