//
//  Animation.swift
//  N'sSimpleGame
//
//  Created by 尾原徳泰 on 2020/05/10.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class Alert:UIViewController {
    
    //最初のアラートを表示する
    func upStartAlert() {
        //アラートのインスタンス生成
        let alertController: UIAlertController
        //アラートの基本骨子作成
        alertController = UIAlertController(title: "ゲーム開始", message: "ボタンを押すと始まるよ", preferredStyle: .alert)
        //アラートのアクションを追加
        let alertAction:UIAlertAction = UIAlertAction(title: "Start", style: .default, handler: nil)
        //アクションを追加
        alertController.addAction(alertAction)
        //アラートを表示
        present(alertController, animated: true)
    }
    
    //スコアのアラートを表示する
    func upFinishAlert(intScore:Int) {
        //アラートのインスタンス生成
        let alertController: UIAlertController
        //アラートの基本骨子作成
        alertController = UIAlertController(title: "終了", message: "得点：\(intScore)", preferredStyle: .alert)
        //アラートのアクションを追加
        let alertAction:UIAlertAction = UIAlertAction(title: "OK", style: .default) { (action: UIAlertAction!) in
            //画面遷移の処理
            self.performSegue(withIdentifier: "goResultVC", sender: nil)
        }
        //アクションを追加
        alertController.addAction(alertAction)
        //アラートを表示
        present(alertController, animated: true)
    }
        
}
