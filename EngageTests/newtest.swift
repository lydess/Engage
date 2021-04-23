//
//  newtest.swift
//  EngageTests
//
//  Created by william Vise on 23/4/21.
//

import Foundation
import XCTest
import Engage

class errorchecker: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    var number = 4
    func testexample() {
        XCTAssert(self.number, 3, file: "number should be 3")
        
    }
}
