//
//  Image.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class Image {
    //問題に使用するbananaピクチャの列挙型を作成
    enum problemBananaImage: Int {
        //ピクチャの向き
        case bananaUp = 0
        case bananaRight = 1
        case bananaDown = 2
        case bananaLeft = 3
    }
    //問題に使用するcadaverピクチャの列挙型を作成
    enum problemCadaverImage: Int {
        //ピクチャの向き
        case cadaverUp = 0
        case cadaverRight = 1
        case cadaverDown = 2
        case cadaverLeft = 3
    }
    //問題に使用するdraculaピクチャの列挙型を作成
    enum problemDraculaImage: Int {
        //ピクチャの向き
        case draculaUp = 0
        case draculaRight = 1
        case draculaDown = 2
        case draculaLeft = 3
    }
    //問題に使用するmarkerピクチャの列挙型を作成
    enum problemMarkerImage: Int {
        //ピクチャの向き
        case markerUp = 0
        case markerRight = 1
        case markerDown = 2
        case markerLeft = 3
    }
    //問題に使用するshowManピクチャの列挙型を作成
    enum problemShowManImage: Int {
        //ピクチャの向き
        case showManUp = 0
        case showManRight = 1
        case showManDown = 2
        case showManLeft = 3
    }
    //多次元配列で問題用のピクチャを管理
    var problemImage:[[String]] = [["bananaUp", "bananaRight", "bananaDown", "bananaLeft"], ["cadaverUp", "cadaverRight", "cadaverDown", "cadaverLeft"], ["draculaUp", "draculaRight", "draculaDown", "draculaLeft"], ["markerUp", "markerRight", "markerDown", "markerLeft"], ["showManUp", "showManRight", "showManDown", "showManLeft"]]
    //imageの選択
    func selectProblemImage() -> String {
        //ランダム関数でどのピクチャか選択(全5種)
        let imageNumber = Int.random(in: 0...4)
        //ランダム関数でピクチャの向きを選択(全4種)
        let imageDirectionNumber = Int.random(in: 0...3)
        //選ばれたImageを代入
        let selectImageName = problemImage[imageNumber][imageDirectionNumber]
        
        return selectImageName
    }
    
    
}
