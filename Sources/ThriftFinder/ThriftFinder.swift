//
//  ThriftFinder.swift
//  ThriftFinder
//
//  Created by Alexander Zaporozhchenko on 10/4/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import Foundation
import ThriftBase


open class Finder {
    
    public init() {}
    
    public func findAllEnumsNamesIn(text: String) -> Set<String> {
        let matchesArray = matches(for: "enum (\\w*)",
                                   in: text,
                                   groupIndex: 1)
        return Set(matchesArray)
    }
    
    public func findAllClassNamesIn(text: String) -> Set<String> {
        let matchesArray = matches(for: "struct (\\w*)",
                                   in: text,
                                   groupIndex: 1)
        return Set(matchesArray)
    }
    
    public func createTrfitClassesFrom(text: String, shouldSearchNestedClasses: Bool = true) -> [ThriftClass] {
        let nsText         = text as NSString
        let pattern        = "struct (\\w*)([^\\{]*)?\\{([^\\}]*)\\}"
        let classesMatches = matches(for: pattern, in: text)
        
        
        let basicClasses =  classesMatches
            .map { match -> ThriftClass in
                let className    = nsText.substring(with: match.range(at: triftClassPart.name.rawValue))
                let fieldsString = nsText.substring(with: match.range(at: triftClassPart.fields.rawValue))
                let fields       = createThriftFieldsFrom(text: fieldsString)
                
                return ThriftClass(name: className,
                                   fields: fields)
        }
        
        if shouldSearchNestedClasses {
            let nestedClasses = findNestedClasses(thriftClasses: basicClasses)
            return basicClasses + nestedClasses
        }
        
        return basicClasses
    }
    
    public func findNestedClasses(thriftClasses: [ThriftClass]) -> [ThriftClass] {
        let mapFinder = MapNestedClassesFinder()
        
        let nestedClasses = thriftClasses
            .map { thriftClass -> [ThriftClass] in
                let fields = thriftClass.fields.filter { $0.type == ThriftType.map }
                
                return fields.map { mapFinder.createTriftClassForNested(type: $0.subType!, propertyName: $0.name) }
            }
            .flatMap { $0 }
        
        return nestedClasses
    }
    
    func createThriftFieldsFrom(text: String) -> [ThriftField] {
        let classString   = text as NSString
        let pattern       = "(((\\/{1,2}\\*{0,2}([^\\Q*/\\E]*)(\\Q*/\\E)?)(\\D*))*)((\\d*):( optional )? ?(\\w*)(<([^>]*)>)? (([^\\/;,\n}])*))"
        let fieldsMatches = matches(for: pattern, in: text)
        
        let fields = fieldsMatches
            .map { match -> ThriftField in
                
                return ThriftField(comment:  classString.field(match:match, type:.comment),
                                   number: classString.field(match:match, type:.number) != nil ? Int(classString.field(match:match, type:.number)!)! : 0 ,
                                   optional: classString.field(match:match, type:.optional) != nil ,
                                   type: classString.field(match:match, type:.type)!,
                                   subType: classString.field(match:match, type:.subType),
                                   name: classString.field(match:match, type:.name)!
                )
        }
        return fields
    }
}

