//
//  Finder Extensions.swift
//  ThriftFinder
//
//  Created by Alexander Zaporozhchenko on 10/4/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import Foundation


extension NSTextCheckingResult {
    func getfield(part: triftFieldPart) -> NSRange? {
        let range = self.range(at: part.rawValue)
        guard range.location != NSNotFound else { return nil }
        return range
    }
}

extension NSString {
    func field(match: NSTextCheckingResult, type: triftFieldPart) -> String? {
        guard let range = match.getfield(part: type) else { return nil }
        return self.substring(with: range)
    }
}

enum triftFieldPart : Int {
    case comment  = 1
    case number   = 8
    case optional = 9
    case type     = 10
    case subType  = 12
    case name     = 13
}

enum triftClassPart : Int {
    case name   = 1
    case fields = 3
}

