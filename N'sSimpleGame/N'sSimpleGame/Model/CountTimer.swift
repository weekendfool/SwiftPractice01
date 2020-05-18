//
//  Timer.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class CountTimer {
    //経過時間をカウントアップするための変数
    var countTimer = 0
    //設定時間の変数
    var setTime = 0
    //timerのインスタンス
    var timer: Timer!
    
    func startTimer() {
        //タイマーを1秒おきに起動
        self.timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(CountTimer.doTimer), userInfo: nil, repeats: true)
    }
    //1秒毎の処理（設定時間を引数にする）
    @objc func doTimer(setTime:Int) -> Int {
        //時間を1秒おきに加算
        countTimer += 1
        //残り時間の計算
        let remainingTime = setTime - countTimer
        //残り時間が0になったときの処理
        stopTimer(remainingTime: remainingTime)
        //残り時間を返す
//        let tringRemainingTime = String(remainingTime)
        return remainingTime
    }
    
    func stopTimer(remainingTime:Int) -> Bool{
        //残り時間が0になったときの処理
        if remainingTime == 0 {
            //タイマーを停止する
            self.timer.invalidate()
        return true
        } else {
            return false
        }
        
    }
}
