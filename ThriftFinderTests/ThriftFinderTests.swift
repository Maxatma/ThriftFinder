//
//  ThriftFinderTests.swift
//  ThriftFinderTests
//
//  Created by Alexander Zaporozhchenko on 10/4/18.
//  Copyright © 2018 Alexander Zaporozhchenko. All rights reserved.
//

import XCTest
@testable import ThriftFinder

class ThriftFinderTests: XCTestCase {

    override func setUp() {
       let classNames = Finder.shared.findAllClassNamesIn(text: "")        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
