//
//  MapNestedClassesConverter.swift
//  ThriftFinder
//
//  Created by Alexander Zaporozhchenko on 10/4/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import Foundation
import ThriftBase


final class MapNestedClassesFinder {
    
    func createTriftClassForNested(type: String, propertyName: String) -> ThriftClass {
        
        let name = propertyName.capitalized + "NestedMapObject"
        
        let trimmed  = type.replacingOccurrences(of: " ", with: "")
        let keyValue = trimmed.split(separator: ",", maxSplits: 1, omittingEmptySubsequences: true)
        let key      = String(keyValue.first!)
        let value    = String(keyValue[1])
        
        let keyField = ThriftField(comment:  "",
                                   number: 0 ,
                                   optional: false ,
                                   type: key,
                                   subType: nil,
                                   name: "key")
        
        let valueField = ThriftField(comment:  "",
                                     number: 1 ,
                                     optional: false ,
                                     type: value,
                                     subType: nil,
                                     name: "value")
        
        let fields = [keyField, valueField]
        
        return ThriftClass(name: name,
                           fields: fields)
    }
}

