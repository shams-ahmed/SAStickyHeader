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
    // MARK: UI Test
    
    func testImageExpand() {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let table = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"SAStickyHeaderExample.View").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Table).element
        table.tap()
        table.tap()
        table.tap()
    }
    
    func testSwipeLeft() {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let table = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"SAStickyHeaderExample.View").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Table).element
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
    }

    func testSwipeRight() {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let table = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"SAStickyHeaderExample.View").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Table).element
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
    }

    func testSwipeLeftToRight() {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let table = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"SAStickyHeaderExample.View").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Table).element
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
        table.tap()
    }
    
    func testSwipeUpDown() {
        XCUIDevice.sharedDevice().orientation = .Portrait
        
        let table = XCUIApplication().otherElements.containingType(.NavigationBar, identifier:"SAStickyHeaderExample.View").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Table).element
        table.tap()
        table.tap()
    }
    
    func testOrientation() {
        XCUIDevice.sharedDevice().orientation = .LandscapeRight
        
        let app = XCUIApplication()
        let table = app.otherElements.containingType(.NavigationBar, identifier:"SAStickyHeaderExample.View").childrenMatchingType(.Other).element.childrenMatchingType(.Other).element.childrenMatchingType(.Table).element
        table.tap()
        table.tap()
        
        let tablesQuery = app.tables
        let loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustryStaticText = tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(7).staticTexts["Lorem Ipsum is simply dummy text of the printing and typesetting industry"]
        loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustryStaticText.tap()
        loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustryStaticText.tap()
        loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustryStaticText.swipeLeft()
        loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustryStaticText.tap()
        loremIpsumIsSimplyDummyTextOfThePrintingAndTypesettingIndustryStaticText.tap()
        tablesQuery.childrenMatchingType(.Cell).elementBoundByIndex(6).staticTexts["Lorem Ipsum is simply dummy text of the printing and typesetting industry"].tap()
    }
}
