//
//  RegexHelpers.swift
//  ThriftFinder
//
//  Created by Alexander Zaporozhchenko on 10/4/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import Foundation


func matches(for regex: String,
             in text: String,
             groupIndex: Int = 0) -> [String] {
    
    let regex    = try! NSRegularExpression(pattern: regex)
    let nsString = text as NSString
    
    let results = regex.matches(in: text,
                                range: NSRange(location: 0, length: nsString.length))
    return results.map { nsString.substring(with: $0.range(at: groupIndex))}
}

func matches(for regex: String,
             in text: String) -> [NSTextCheckingResult] {
    
    let regex    = try! NSRegularExpression(pattern: regex)
    let nsString = text as NSString
    
    let results = regex.matches(in: text,
                                range: NSRange(location: 0, length: nsString.length))
    return results
}

