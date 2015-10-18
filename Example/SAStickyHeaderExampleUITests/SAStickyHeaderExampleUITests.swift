//
//  SAStickyHeaderExampleUITests.swift
//  SAStickyHeaderExampleUITests
//
//  Created by shams ahmed on 18/10/2015.
//  Copyright © 2015 SA. All rights reserved.
//

import XCTest

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
    // MARK: Test
    
    func testImageExpand() {
        XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Table).element.swipeDown()
    }
    
    func testSwipeLeft() {
        let table = XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Table).element
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
    }

    func testSwipeRight() {
        let table = XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Table).element
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
    }

    func testSwipeLeftToRight() {
        let table = XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Table).element
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeLeft()
        table.doubleTap()
        table.swipeLeft()
        table.swipeLeft()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeRight()
        table.swipeDown()
    }
    
    func testSwipeUpDown() {
        
        let app = XCUIApplication()
        let table = app.childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Table).element
        table.swipeDown()
        table.swipeUp()
        XCUIDevice.sharedDevice().orientation = .Portrait
    }
    
    func testOrientation() {
        XCUIDevice.sharedDevice().orientation = .LandscapeRight
        
        let table = XCUIApplication().childrenMatchingType(.Window).elementBoundByIndex(0).childrenMatchingType(.Table).element
        table.swipeLeft()
        table.swipeRight()
        table.swipeRight()
        table.swipeDown()
        table.swipeDown()
        table.swipeRight()
    }
}
