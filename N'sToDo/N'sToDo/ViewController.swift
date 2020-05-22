//
//  ViewController.swift
//  N'sToDo
//
//  Created by 尾原徳泰 on 2020/05/21.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testLabel: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // userdefaultのインスタンス作成
        let userDefaults = UserDefaults.standard
        //MyDataのインスタンス作成
        let data = MyData()
        //MyDataのプロパティに値を保存
        data.valueString = "test"
        //値の保存
        userDefaults.set(data, forKey: "data")
        //UserDefaults値の保存を明示的にする
        userDefaults.synchronize()
        
    }

    @IBAction func buttonAction(_ sender: Any) {
        // userdefaultのインスタンス作成
        let userDefaults = UserDefaults.standard
        //保存する
        userDefaults.set(testLabel.text, forKey: "text")
        //UserDefaults値の保存を明示的にする
        userDefaults.synchronize()
    }
     
}

