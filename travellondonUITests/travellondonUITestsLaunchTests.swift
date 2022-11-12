//
//  travellondonUITestsLaunchTests.swift
//  travellondonUITests
//
//  Created by Tony Cheung on 17/10/2022.
//

import XCTest

enum LaunchingError: Error {
    case insufficientTabBarTestCases
}

final class travellondonUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        false
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testAtLaunching() throws {
        
        let app = XCUIApplication()
        app.launch()
        
        try checkTheTabBarItem(app: app)

        try testExplorerView(app: app)
        
        try testCategoriesView(app: app)
        
        try testMoreView(app: app)

//        try testEventDetailView(app: app)
    }
    
    private func checkTheTabBarItem(app: XCUIApplication) throws {
        
        for i in 0...app.tabBars.buttons.allElementsBoundByIndex.count - 1 {
            switch (i) {
            case 0:
                XCTAssertTrue(app.tabBars.buttons.allElementsBoundByIndex[i].label == "Explorer")
            case 1:
                XCTAssertTrue(app.tabBars.buttons.allElementsBoundByIndex[i].label == "Categories")
            case 2:
                XCTAssertTrue(app.tabBars.buttons.allElementsBoundByIndex[i].label == "Saved")
            case 3:
                XCTAssertTrue(app.tabBars.buttons.allElementsBoundByIndex[i].label == "Transport")
            case 4:
                XCTAssertTrue(app.tabBars.buttons.allElementsBoundByIndex[i].label == "More")
            default:
                throw LaunchingError.insufficientTabBarTestCases
            }
        }
    }
    
    func testExplorerView(app: XCUIApplication) throws {
        
        print("----------Testing Explorer View----------")
        
        try tapTabBar(app: app, labelString: "Explorer")
        
        ["Magical things to do in October",
         "Unforgettable Priceless experiences",
         "Top family experiences"].map { titleString in

            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0).cells.allElementsBoundByIndex.filter { element in
                element.staticTexts.element(boundBy: 0).label == titleString
            }.count > 0, "App does not contain the title " + titleString)
        }

        app.swipeUp()

        let titleString = "Top theatre shows"
        print("Checking the title: " + titleString)
        XCTAssertTrue(app.collectionViews.element(boundBy: 0).cells.allElementsBoundByIndex.filter { element in
            element.staticTexts.element(boundBy: 0).label ==  titleString
        }.count > 0, "App does not contain the title " +  titleString)
    }
    
    func testCategoriesView(app: XCUIApplication) throws {
        
        print("----------Testing Categories View----------")
        
        try tapTabBar(app: app, labelString: "Categories")
        
        ["nearme",
         "offers",
         "mustsee",
         "priceless",
         "free"].map { titleString in
            
            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.element(boundBy: 0)
                             .otherElements.element(boundBy: 1)
                             .buttons.allElementsBoundByAccessibilityElement.filter{ element in
                                 element.identifier == titleString
                             }.count > 0, "Categories Page does not contain the title " + titleString)
        }
        
        app.swipeUp()
        
        ["shopping",
         "theatre",
         "markets",
         "fooddrink",
         "artmuseum"].map { titleString in
            
            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.element(boundBy: 0)
                             .otherElements.element(boundBy: 1)
                             .buttons.allElementsBoundByAccessibilityElement.filter{ element in
                                 element.identifier == titleString
                             }.count > 0, "Categories Page does not contain the title " + titleString)
        }

        
    }
    
    func testMoreView(app: XCUIApplication) throws {
        
        print("----------Testing More View----------")
        
        try tapTabBar(app: app, labelString: "More")
        
        ["About US",
         "F.A.Q.",
         "Terms & Conditions",
         "Like this app? Rate us on the App Store",
         "Licenses",
         "Language",
         "Low Data Mode"].map { titleString in

            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0).cells.allElementsBoundByIndex.filter { element in
                element.staticTexts.element(boundBy: 0).label == titleString
            }.count > 0, "More Page does not contain the title " + titleString)
        }
    }
    
    func testEventDetailView(app: XCUIApplication) throws {
        
        print("----------Testing Event Detail View----------")
    }
    
    private func tapTabBar(app: XCUIApplication, labelString: String) throws {
        
        if let tabBarButton = app.tabBars.buttons.allElementsBoundByIndex.filter({ element in
            element.label == labelString
        }).first {
            tabBarButton.tap()
        } else {
            print("No button found")
        }
    }
}
