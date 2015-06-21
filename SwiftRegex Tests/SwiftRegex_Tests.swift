//
//  SwiftRegex_Tests.swift
//  SwiftRegex Tests
//
//  Created by Gregory Todd Williams on 6/7/14.
//  Copyright (c) 2014 Gregory Todd Williams. All rights reserved.
//

import XCTest

class SwiftRegex_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRegexLiterals() {
        XCTAssert("abcdefg" =~ "abc", "match literal")
        XCTAssertFalse("abcdefg" =~ "fgh", "match literal")
    }
    
    func testRegexWildcards() {
        XCTAssert("abcdefg" =~ "a.c", "match dot")
        XCTAssert("abcdefg" =~ "a.*b", "match dot star")
        XCTAssert("abcdefg" =~ "a.*g", "match dot star")
        XCTAssert("abcdefg" =~ "a.+g", "match dot plus")
        XCTAssertFalse("abcdefg" =~ "a.+b", "match dot plus")
    }
    
    func testRegexAnchor() {
        XCTAssert("abcdefg" =~ "^abc", "start anchor")
        XCTAssertFalse("abcdefg" =~ "^efg", "start anchor")
        XCTAssert("abcdefg" =~ "efg$", "end anchor")
        XCTAssertFalse("abcdefg" =~ "abc$", "end anchor")
    }
    
    func testUnicodeRange() {
        let value = "Hello, 火星, 🔥🌠!"
        let pattern = "[\\u6620-\\U0001F500]"
        let pattern2 = "[\\U0001F550-\\U0001FFFF]"
        var count = 0
        let matches = value =~ pattern
        for _ in matches {
            count++
        }
        XCTAssertEqual(count, 2, "count of range matches")
        XCTAssertEqual(matches[0], "火", "match (1/2)")
        XCTAssertEqual(matches[1], "🌠", "match (2/2)")

        XCTAssert(value =~ pattern, "LogicValue (1/2)")
        XCTAssertFalse(value =~ pattern2, "LogicValue (1/2)")
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
