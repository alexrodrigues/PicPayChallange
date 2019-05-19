//
//  UITests.swift
//  UITests
//
//  Created by Alex Rodrigues on 19/05/19.
//  Copyright © 2019 Alex Rodrigues. All rights reserved.
//

import XCTest

class UITests: XCTestCase {

    private var application: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        application = XCUIApplication()
        application.launch()
    }

    override func tearDown() {
    }

    func testIfNavigationIsThere() {
        XCTAssertTrue(application.navigationBars["NavBar"].exists)
    }

    func testIfTableViewIsThere() {
        XCTAssertTrue(application.tables["HomeTableView"].exists)
    }
    
    func testIfTableViewCanScroll() {
        let exp = expectation(description: "Waiting Screen wake up")
        _ = XCTWaiter.wait(for: [exp], timeout: 7.0)
        let table = application.tables["HomeTableView"]
        table.swipeDown()
        table.swipeUp()
    }
    
    func testIfCanNavigate() {
        let exp = expectation(description: "Waiting Screen wake up")
        _ = XCTWaiter.wait(for: [exp], timeout: 5.0)
        let table = application.tables["HomeTableView"]
        table.cells.element(boundBy: 0)
    }
}
