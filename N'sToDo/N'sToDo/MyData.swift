//
//  MyData.swift
//  N'sToDo
//
//  Created by 尾原徳泰 on 2020/05/22.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import Foundation

class MyData: NSObject, NSSecureCoding {
    
    static var supportsSecureCoding: Bool {
        return true
    }
    
    var valueString: String?
    
    override init() {
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(valueString, forKey: "valueString")
    }
    
    required init?(coder aDecoder: NSCoder) {
        valueString = aDecoder.decodeObject(forKey: "valueString") as? String
    }
    
}
