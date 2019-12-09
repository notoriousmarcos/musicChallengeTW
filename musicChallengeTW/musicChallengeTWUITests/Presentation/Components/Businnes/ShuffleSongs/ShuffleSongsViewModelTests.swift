//
//  ShuffleSongsViewModelTests.swift
//  musicChallengeTWTests
//
//  Created by Marcos Vinicius da Cunha Brito on 08/12/19.
//  Copyright © 2019 Marcos Vinicius da Cunha Brito. All rights reserved.
//

import XCTest
@testable import musicChallengeTW

class ShuffleSongsViewUITests: XCTestCase {

    override func setUp() {
        continueAfterFailure = false
    }

    override func tearDown() {
    }

    func testShuffleSongsViewLoadedUITests() {
        let app = XCUIApplication()
        app.launch()
        app.navigationBars["Shuffle Songs"].staticTexts["Shuffle Songs"].tap()
        app.tables.cells.otherElements.firstMatch.children(matching: .other).element.tap()

    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
