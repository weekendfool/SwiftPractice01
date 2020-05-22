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
        //userDefaultsに値が入っているかの確認
        if let value = userDefaults.string(forKey: "text") {
            //もし値があったなら表示
            testLabel.text = value
        } else {
            print(value(forKey: "text"))
        }
    }

    @IBAction func buttonAction(_ sender: Any) {
    }
     
}

