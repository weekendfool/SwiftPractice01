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
    var score = UserDefaults.standard
    
    func recordScore(nowscore:Int) {
        //現在の得点を記録
        score.set(nowscore, forKey: "score")
    }
    //今回の記録と比較して上回っていれば更新
    func compareScore(score:Int, first:Int, second:Int, third:Int) {
        //値を比較して更新
        if score > first {
            firstPlace.set(score, forKey: "firstPlace")
        } else if score > second && score < first {
            secondPlace.set(score, forKey: "secondPlace")
        } else if score > third && score < second {
            thirdPlace.set(score, forKey: "thirdPlace")
        }
    }
    
}
