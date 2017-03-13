//
//  SAStickyHeaderExampleUITests.swift
//  SAStickyHeaderExampleUITests
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import XCTest

@available(iOS 9.0, *)
class SAStickyHeaderExampleUITests: XCTestCase {
    
    // MARK:
    // MARK: Setup
    
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // MARK:
    // MARK: UI Test
    
    func testImageExpand() {
        XCUIDevice.shared().orientation = .portrait
        
        let table = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.swipeDown()
        table.swipeDown()
        table.swipeDown()
        table.swipeUp()
        table.swipeDown()
    }
    
    func testSwipeLeft() {
        XCUIDevice.shared().orientation = .portrait
        
        let table = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
    }

    func testSwipeRight() {
        XCUIDevice.shared().orientation = .portrait
        
        let table = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeDown()
        table.swipeRight()
        table.swipeRight()
    }

    func testSwipeLeftToRight() {
        XCUIDevice.shared().orientation = .portrait
        
        let table = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.swipeDown()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeLeft()
        table.swipeDown()
        table.swipeLeft()
        table.swipeRight()
        table.swipeRight()
    }
    
    func testSwipeUpDown() {
        XCUIDevice.shared().orientation = .portrait
        
        let app = XCUIApplication()
        let table = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.swipeUp()
        app.tables.children(matching: .cell).element(boundBy: 0).staticTexts["Lorem Ipsum is simply dummy text of the printing and typesetting industry"].swipeUp()
        table.swipeDown()
        table.swipeDown()
        table.swipeUp()
        table.swipeDown()
    }
    
    func testOrientation() {
        XCUIDevice.shared().orientation = .landscapeRight
        
        let app = XCUIApplication()
        let table = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.swipeRight()
        table.swipeLeft()
        table.swipeLeft()
        
        let tablesQuery = app.tables
        tablesQuery.children(matching: .cell).element(boundBy: 2).staticTexts["Lorem Ipsum is simply dummy text of the printing and typesetting industry"].swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeLeft()
        table.swipeRight()
        table.swipeRight()
        XCUIDevice.shared().orientation = .portraitUpsideDown
        table.swipeUp()
        table.swipeLeft()
        tablesQuery.children(matching: .cell).element(boundBy: 1).staticTexts["Lorem Ipsum is simply dummy text of the printing and typesetting industry"].swipeRight()
        XCUIDevice.shared().orientation = .landscapeLeft
        XCUIDevice.shared().orientation = .portraitUpsideDown
        XCUIDevice.shared().orientation = .landscapeRight
        XCUIDevice.shared().orientation = .portrait
        table.swipeDown()
        table.swipeUp()
    }
    
    func testDidTapImage() {
        XCUIDevice.shared().orientation = .portrait
        
        let table = XCUIApplication().children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element
        table.tap()
        table.swipeLeft()
        table.tap()
    }
}
