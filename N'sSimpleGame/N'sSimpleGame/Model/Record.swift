//
//  File.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/13.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Record {
    //1位から3位までの記録保持用の変数を作成
    var firstPlace = UserDefaults.standard
    var secondPlace = UserDefaults.standard
    var thirdPlace = UserDefaults.standard
    //現在のゲーム得点用の変数作成
    var nowscore = UserDefaults.standard
    //前回のゲーム得点用の変数作成
    var lastScore = UserDefaults.standard
    //正解数の変数
    var numberOfCorrectAnswers = UserDefaults.standard
    //不正解数の変数
    var numberOfIncorrectAnswers = UserDefaults.standard
    
    func recordScore(score:Int) {
        //現在の得点を記録
        nowscore.set(score, forKey: "score")
    }
    //今回の記録と比較して上回っていれば更新し前回のスコアに記録する
    func compareScore(score:Int, first:Int, second:Int, third:Int) {
        //値を比較して更新
        if score > first {
            firstPlace.set(score, forKey: "firstPlace")
        } else if score > second && score < first {
            secondPlace.set(score, forKey: "secondPlace")
        } else if score > third && score < second {
            thirdPlace.set(score, forKey: "thirdPlace")
        }
        //前回のスコアに登録
        lastScore.set(score, forKey: "lastScore")
        //ゲームのスコアを初期化
        nowscore.set(0, forKey: "score")
    }
    //次のゲームに備えて初期化する
    func resetScore() {
        //ゲームのスコアを初期化
        nowscore.set(0, forKey: "score")
        //ゲームの正解数を初期化
        numberOfCorrectAnswers.set(0, forKey: "numberOfCorrectAnswers")
        //ゲームの不正解数を初期化
        numberOfIncorrectAnswers.set(0, forKey: "numberOfIncorrectAnswers")
    }
}
