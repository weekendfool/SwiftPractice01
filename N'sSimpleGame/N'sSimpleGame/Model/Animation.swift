//
//  Animation.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewAnimation {
    //アニメーションで頭を動かす
    func doAnimation(selectDirectionNumber: Int) {
        UIView.animate(withDuration: 1.0, delay: 0.0, animations: {
            //selectDirectionNumberで操作したviewの方向を取得、方向毎に頭を動かす
            switch selectDirectionNumber {
            case 0:
                return self.view.center.y -= 100
            case 1:
                return self.view.center.x += 100
            case 2:
                return self.view.center.x -= 100
            case 3:
                return self.view.center.y += 100
            default:
                return
            }
        }, completion: nil)
        
        //アニメーション用のviewを作る
        
    }
}
