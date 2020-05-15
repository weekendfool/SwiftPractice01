//
//  Game.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/15.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class Gamge {
    
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
    func judge() {
        //imageのインスタンス作成
        let image = Image()
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
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (0, 2):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (0, 3):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (1, 0):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (1, 1):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (1, 2):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (1, 3):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (2, 0):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (2, 1):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (2, 2):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (2, 3):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (3, 0):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (3, 1):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (3, 2):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (3, 3):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (4, 0):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (4, 1):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (4, 2):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        case (4, 3):
            enumNumber = Image.problemBananaImage.bananaUp.rawValue
            print(enumNumber)
        default:
            return
        }
    }
    //スコアのアラートを表示する
}
