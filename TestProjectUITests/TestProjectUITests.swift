//
//  TestProjectUITests.swift
//  TestProjectUITests
//
//  Created by SF on 01.06.2021.
//

import XCTest

class TestProjectUITests: XCTestCase {

    var countOfTheTable: Int?
    var cellText: String?
    var tableViewIdentifier: String?
    var tableViewCellIdentifier: String?
    
    override func setUpWithError() throws {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        countOfTheTable = 1
        cellText = "Петров Петр"
        tableViewIdentifier = "tableView"
        tableViewCellIdentifier = "tableViewCell"

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        
    }

    override func tearDownWithError() throws {
        
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        countOfTheTable = nil
        cellText = nil
        tableViewIdentifier = nil
        tableViewCellIdentifier = nil
        
    }

    func testExample() throws {
        
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        // get the tableView
        guard let tableViewIdentifier = tableViewIdentifier else {
            return
        }
        
        let tableView = app.tables[tableViewIdentifier]
        
        guard let countOfTheTable = countOfTheTable else {
            return
        }
        
        // check the count of cells
        XCTAssert(tableView.cells.count == countOfTheTable)
        
        guard let tableViewCellIdentifier = tableViewCellIdentifier else {
            return
        }
        
        let currentCells = tableView.cells.containing(.cell, identifier: tableViewCellIdentifier)
        let currentCellLabelText = currentCells.staticTexts.element(boundBy: 0).label
         
        // check the text in cell with control text (from variable cellText)
        XCTAssertEqual(currentCellLabelText, cellText)
         
        // going to the second view controller
        currentCells.staticTexts.element(boundBy: 0).tap()
        
        XCTAssertEqual(app.staticTexts["fullNameLabel"].label, currentCellLabelText)
        XCTAssertEqual(app.staticTexts["cityLabel"].label, "Москва")
        XCTAssertEqual(app.staticTexts["friendsTitleLabel"].label, "Друзья:")
        XCTAssertEqual(app.staticTexts["friendsLabel"].label, "Иванов Иван\nСергеев Сергей")
        XCTAssertEqual(app.staticTexts["settingsLabel"].label, "Настройки страницы:")
        XCTAssertEqual(app.staticTexts["accessLabel"].label, "Доступ к странице:")
        
    }
    
    func testUIByRecording() throws {
    
//        let app = XCUIApplication()
//        app.tables["tableView"]/*@START_MENU_TOKEN@*/.staticTexts["0"]/*[[".cells[\"Петров Петр\"]",".staticTexts[\"Петров Петр\"]",".staticTexts[\"0\"]",".cells[\"tableViewCell\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["fullNameLabel"]/*[[".staticTexts[\"Петров Петр\"]",".staticTexts[\"fullNameLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["cityLabel"]/*[[".staticTexts[\"Москва\"]",".staticTexts[\"cityLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["friendsTitleLabel"]/*[[".staticTexts[\"Друзья:\"]",".staticTexts[\"friendsTitleLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["friendsLabel"]/*[[".staticTexts[\"Иванов Иван\\nСергеев Сергей\"]",".staticTexts[\"friendsLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["settingsLabel"]/*[[".staticTexts[\"Настройки страницы:\"]",".staticTexts[\"settingsLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app/*@START_MENU_TOKEN@*/.staticTexts["accessLabel"]/*[[".staticTexts[\"Доступ к странице:\"]",".staticTexts[\"accessLabel\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
//        app.switches["closedPageSwitch"].tap()
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
