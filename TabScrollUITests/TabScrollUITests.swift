//
//  TabScrollUITests.swift
//  TabScrollUITests
//
//  Created by xieran on 2018/3/26.
//  Copyright © 2018年 xieran. All rights reserved.
//

import XCTest

class TabScrollUITests: XCTestCase {
        
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
    
    func testExample() {
        
        let app = XCUIApplication()
        app/*@START_MENU_TOKEN@*/.buttons["2000"]/*[[".scrollViews.buttons[\"2000\"]",".buttons[\"2000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let button = app/*@START_MENU_TOKEN@*/.buttons["3000"]/*[[".scrollViews.buttons[\"3000\"]",".buttons[\"3000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button.tap()
        
        let button2 = app/*@START_MENU_TOKEN@*/.buttons["4000"]/*[[".scrollViews.buttons[\"4000\"]",".buttons[\"4000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button2.tap()
        
        let button3 = app/*@START_MENU_TOKEN@*/.buttons["7000"]/*[[".scrollViews.buttons[\"7000\"]",".buttons[\"7000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button3.tap()
        button2.swipeRight()
        button3.swipeLeft()
        
        let button4 = app/*@START_MENU_TOKEN@*/.buttons["5000"]/*[[".scrollViews.buttons[\"5000\"]",".buttons[\"5000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        button4.swipeRight()
        app/*@START_MENU_TOKEN@*/.buttons["6000"]/*[[".scrollViews.buttons[\"6000\"]",".buttons[\"6000\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.swipeLeft()
        button.swipeRight()
        button2.swipeLeft()
        button.swipeRight()
        button4.swipeLeft()
        button.swipeRight()
        
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element
        element.tap()
        button.tap()
        element.tap()
        button2.tap()
        element.tap()
        
    }
    
}
