//
//  CKRecord+Extensions.swift
//  BebidasAbiguinhos
//
//  Created by Giovanni Bruno on 04/10/17.
//  Copyright © 2017 Piera Marchesini. All rights reserved.
//

import Foundation
import CloudKit

extension CKRecord {
    
    subscript(key: DrinkKey) -> Any? {
        get {
            return self[key.rawValue]
        }
        set {
            self[key.rawValue] = newValue as? CKRecordValue
        }
    }
    
}
