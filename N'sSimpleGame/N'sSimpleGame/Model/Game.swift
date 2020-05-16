//
//  Game.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class Gamge {
    var numberOfCorrectAnswers = 0
    var numberOfIncorrectAnswers = 0
    //スタートする処理
    func startGame() -> (numberOfCorrectAnswers:Int, numberOfIncorrectAnswers:Int, startFlag:Bool){
        //記録用のインスタンスを作成
        let record = Record()
        //初期化
        record.resetScore()
        var numberOfCorrectAnswers = UserDefaults.standard.integer(forKey: "numberOfCorrectAnswers")
        //不正解数の変数
        var numberOfIncorrectAnswers = UserDefaults.standard.integer(forKey: "numberOfIncorrectAnswers")
        //スタート1回目のフラグ
        var startFlag = true
        
        return (numberOfIncorrectAnswers, numberOfIncorrectAnswers, startFlag)
    }
    
    //ゲームのviewを表示する
    func DisplayView() -> Any {
        var imageFlag = false
        //初期イメージをゲーム用の画像に設定
        var gameImage:UIImage = UIImage(named: "main")!
        //imageのインスタンス作成
        let image = Image()
        //viewに写真がない時にランダムでimageを表示
        if imageFlag != true {
            let selectImageName = image.selectProblemImage().selectImageName
            //imageをランダムに選び出す処理を実行して格納
            gameImage = UIImage(named: "\(selectImageName)")!
            //imageFlagをtrueにする
            imageFlag = true
        }
        return gameImage
    }
    
    //正解不正解を判断する
    func judge(selectDirection:Int) -> Bool {
        //imageのインスタンス作成
        let image = Image()
        //正解のときtrueの変数
        var judgeFlag:Bool
        //recordインスタンスを作成
        let number = Record()
        
        var imageNumber = image.selectProblemImage().imageNumber
        var imageDirectionNumber = image.selectProblemImage().imageDirectionNumber
        //どの列挙体を使用するかの数字
        var enumNumber = 6
        //問題の正解を格納する
        switch (imageNumber, imageDirectionNumber)  {
        case (0, 0):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (0, 1):
            enumNumber = Image.problemBananaImage.bananaRight.rawValue
            print(enumNumber)
        case (0, 2):
            enumNumber = Image.problemBananaImage.bananaDown.rawValue
            print(enumNumber)
        case (0, 3):
            enumNumber = Image.problemBananaImage.bananaLeft.rawValue
            print(enumNumber)
        case (1, 0):
            enumNumber = Image.problemCadaverImage.cadaverUp.rawValue
            print(enumNumber)
        case (1, 1):
            enumNumber = Image.problemCadaverImage.cadaverRight.rawValue
            print(enumNumber)
        case (1, 2):
            enumNumber = Image.problemCadaverImage.cadaverDown.rawValue
            print(enumNumber)
        case (1, 3):
            enumNumber = Image.problemCadaverImage.cadaverLeft.rawValue
            print(enumNumber)
        case (2, 0):
            enumNumber = Image.problemDraculaImage.draculaUp.rawValue
            print(enumNumber)
        case (2, 1):
            enumNumber = Image.problemDraculaImage.draculaRight.rawValue
            print(enumNumber)
        case (2, 2):
            enumNumber = Image.problemDraculaImage.draculaDown.rawValue
            print(enumNumber)
        case (2, 3):
            enumNumber = Image.problemDraculaImage.draculaLeft.rawValue
            print(enumNumber)
        case (3, 0):
            enumNumber = Image.problemMarkerImage.markerUp.rawValue
            print(enumNumber)
        case (3, 1):
            enumNumber = Image.problemMarkerImage.markerRight.rawValue
            print(enumNumber)
        case (3, 2):
            enumNumber = Image.problemMarkerImage.markerDown.rawValue
            print(enumNumber)
        case (3, 3):
            enumNumber = Image.problemMarkerImage.markerLeft.rawValue
            print(enumNumber)
        case (4, 0):
            enumNumber = Image.problemShowManImage.showManUp.rawValue
            print(enumNumber)
        case (4, 1):
            enumNumber = Image.problemShowManImage.showManRight.rawValue
            print(enumNumber)
        case (4, 2):
            enumNumber = Image.problemShowManImage.showManDown.rawValue
            print(enumNumber)
        case (4, 3):
            enumNumber = Image.problemShowManImage.showManLeft.rawValue
            print(enumNumber)
        default:
            return false
        }
        //選んだ答えと正解を比較
        if enumNumber == selectDirection {
            judgeFlag = true
        } else {
            judgeFlag = false
        }
        return judgeFlag
    }
    //正誤判定から点数を上げる
    func countUp(judgeFlag:Bool, InputNumberOfCorrectAnswers:Int, InputNumberOfIncorrectAnswers:Int, startFlag:Bool) -> (numberOfCorrectAnswers:Int, numberOfIncorrectAnswers:Int ) {
        //記録用のインスタンスを作成
        var record = Record()
        var startFlag = startFlag
        //最初だけ正解数と不正解数を呼び出す
        if startFlag {
            numberOfCorrectAnswers = InputNumberOfCorrectAnswers
            numberOfIncorrectAnswers = InputNumberOfIncorrectAnswers
            //1回目の検知が終わったらフラグをオフに
            startFlag = false
        }
        
        if judgeFlag {
            numberOfCorrectAnswers += 1
        } else {
            numberOfIncorrectAnswers += 1
        }
        return (numberOfCorrectAnswers, numberOfIncorrectAnswers)
    }
    //スコアを記録する
    func finishGame(numberOfCorrectAnswers:Int, numberOfIncorrectAnswers:Int) {
        var score = Record()
        //正解数と不正解数を記録
        UserDefaults.standard.set(numberOfCorrectAnswers, forKey: "numberOfCorrectAnswers")
        UserDefaults.standard.set(numberOfIncorrectAnswers, forKey: "numberOfIncorrectAnswers")
        //スコアを算出(正解数*10*正解数/（問題数）)
        let doubleScore = numberOfCorrectAnswers * 10 * numberOfCorrectAnswers / (numberOfCorrectAnswers + numberOfIncorrectAnswers)
        let intScore = Int(doubleScore)
        //スコアを記録
        score.recordScore(score: intScore)
    }
    //スコアのアラートを表示する
}
