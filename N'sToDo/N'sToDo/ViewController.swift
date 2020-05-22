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
        do {
            let archiveData = try NSKeyedArchiver.archivedData(withRootObject: data, requiringSecureCoding: true)
            userDefaults.set(archiveData, forKey: "data")
            userDefaults.synchronize()
        }
        
        if let storedData = userDefaults.object(forKey: "data") as? Data {
            if let unachivedData = try NSKeyedUnarchiver.unarchivedObject(ofClass: MyData.self, from: storedData) {
                if let valueString = unachivedData.valueString {
                    print("デシリアライズデータ：" +  valueString)
                }
            }
        
        } catch {
        print("エラー \(error)")
    }
    }


    @IBAction func buttonAction(_ sender: Any) {
        // userdefaultのインスタンス作成
        let userDefaults = UserDefaults.standard
        //保存する
        userDefaults.set(testLabel.text, forKey: "data")
        //UserDefaults値の保存を明示的にする
        userDefaults.synchronize()
    }
     
}

