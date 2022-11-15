//
//  travellondonUITestsLaunchTests.swift
//  travellondonUITests
//
//  Created by Tony Cheung on 17/10/2022.
//

import XCTest

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
            
            testNavigationBar(app, type: "normal")
            
            checkTheTabBarItem(app, tabBarButtonArray: ["Explorer", "Categories", "Saved", "Transport", "More"])

            tapTabBar(app, labelString: "Explorer")
        
            // First row of collection view
            app.collectionViews.element(boundBy: 0)
               .cells.element(boundBy: 0).tap()

            testEventDetailView(app)
        
            // Back Button
            app.buttons.allElementsBoundByAccessibilityElement.filter { $0.identifier == "eventDetailNavigationBarBackButton" }.first?.tap()

            testExplorerView(app:app)
        
            tapTabBar(app, labelString: "Categories")

            testCategoriesView(app:app)
        
            tapTabBar(app, labelString: "More")

            testMoreView(app:app)
 
    }
    
    private func checkTheTabBarItem(_ app:XCUIApplication, tabBarButtonArray: [String])  {
        
        for i in 0...app.tabBars.buttons.allElementsBoundByIndex.count - 1 {
            XCTAssertTrue(app.tabBars.buttons.allElementsBoundByIndex[i].label == tabBarButtonArray[i])
        }
    }
    
    func testExplorerView(app:XCUIApplication)  {
        
        print("----------Testing Explorer View----------")
        
        let titleArray = ["Magical things to do in October",
                          "Unforgettable Priceless experiences",
                          "Top family experiences"]
            
        for titleString in titleArray {
            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.allElementsBoundByIndex.filter { element in
                                 element.staticTexts.element(boundBy: 0).label == titleString
                             }.count > 0, "App does not contain the title " + titleString)
        }

        app.swipeUp()

        let titleString = "Top theatre shows"
        print("Checking the title: " + titleString)
        XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                         .cells.allElementsBoundByIndex.filter { element in
                            element.staticTexts.element(boundBy: 0).label ==  titleString
                         }.count > 0, "App does not contain the title " +  titleString)
    }
    
    func testCategoriesView(app:XCUIApplication)  {
        
        print("----------Testing Categories View----------")
        
        let titleArray = [
            "nearme",
            "offers",
            "mustsee",
            "priceless",
            "free"]
        
        for titleString in titleArray {
            
            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.element(boundBy: 0)
                             .otherElements.element(boundBy: 1)
                             .buttons.allElementsBoundByAccessibilityElement.filter{ element in
                                 element.identifier == titleString
                             }.count > 0, "Categories Page does not contain the title " + titleString)
        }
        
        app.swipeUp()
        
        let title1Array = [
            "shopping",
            "theatre",
            "markets",
            "fooddrink",
            "artmuseum"]
            
        for titleString in title1Array {
            
            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.element(boundBy: 0)
                             .otherElements.element(boundBy: 1)
                             .buttons.allElementsBoundByAccessibilityElement.filter{ element in
                                 element.identifier == titleString
                            }.count > 0, "Categories Page does not contain the title " + titleString)
        }
            
    }

    
    func testMoreView(app:XCUIApplication)  {
        
        print("----------Testing More View----------")
        
        let titleArray = ["About US",
                          "F.A.Q.",
                          "Terms & Conditions",
                          "Like this app? Rate us on the App Store",
                          "Licenses",
                          "Language",
                          "Low Data Mode"]

        for titleString in titleArray {

            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.allElementsBoundByIndex.filter { element in
                                 element.staticTexts.element(boundBy: 0).label == titleString
                             }.count > 0, "More Page does not contain the title " + titleString)
        }

        //Select Chinese Language

        selectLanguage(app:app, language: "zh")

        let title1Array = ["關於我們",
                          "F.A.Q.",
                          "使用條款",
                          "喜歡這個程式？給我們一個讚！",
                          "牌照",
                          "低流量模式"]

        for titleString in title1Array {

            print("Checking the title: " + titleString)
            XCTAssertTrue(app.collectionViews.element(boundBy: 0)
                             .cells.allElementsBoundByIndex.filter { element in
                                 element.staticTexts.element(boundBy: 0).label == titleString
                             }.count > 0, "More Page does not contain the title " + titleString)
        }

        checkTheTabBarItem(app,
                           tabBarButtonArray: ["探索", "類別", "保全", "交通", "更多"])
        
        //Resume
        selectLanguage(app:app, language: "en")
    }
    
    func selectLanguage(app:XCUIApplication, language:String) {
        
        app.buttons.allElementsBoundByAccessibilityElement.filter { elemnet in
            elemnet.identifier == "languagePicker"
        }.first?.tap()
        
        app.buttons.allElementsBoundByIndex.filter { element in
            element.identifier == language
        }.first?.tap()
    }
    
    func testEventDetailView(_ app:XCUIApplication)  {
        
        print("----------Testing Event Detail View----------")
        
        // Verify the button on navigation bar
        
        testNavigationBar(app, type: "eventDetail")
        let eventImageView = app.descendants(matching: .any)["eventDetailmageView"]
        XCTAssertTrue(eventImageView.images.allElementsBoundByIndex[0].label == "lionking_image1")
        eventImageView.swipeLeft()
        XCTAssertTrue(eventImageView.images.allElementsBoundByIndex[0].label == "lionking_image2")
        eventImageView.swipeLeft()
        XCTAssertTrue(eventImageView.images.allElementsBoundByIndex[0].label == "lionking_image3")

        app.swipeUp()
        
        XCTAssertTrue(app.descendants(matching: .staticText)["eventInfomationNameView"].label == "The Lion King: The Musical ar the Lyceum Theatre")
        XCTAssertTrue(app.descendants(matching: .staticText)["eventInfomationDateView"].label == "Until 17 Jan 2023")
        XCTAssertTrue(app.descendants(matching: .staticText)["eventInfomationAddressView"].label == "Wellington Street, London, WC2E 7RQ")

        XCTAssertTrue(app.descendants(matching: .staticText)["eventInfomationDescriptionView"].label.contains("Follow Simba's adventures in The Lion King Musical"))
        XCTAssertFalse(app.descendants(matching: .staticText)["eventInfomationDescriptionView"].label.contains("the epic adventure of his journey from wide-eyed cub"))
        
        app.descendants(matching: .button)["eventInfomationShowMoreButton"].tap()
        
        XCTAssertTrue(app.descendants(matching: .staticText)["eventInfomationDescriptionView"].label.contains("Follow Simba's adventures in The Lion King Musical"))
        XCTAssertTrue(app.descendants(matching: .staticText)["eventInfomationDescriptionView"].label.contains("the epic adventure of his journey from wide-eyed cub"))
        
        app.swipeUp()
        
        let eventPriceAdultView = app.staticTexts.allElementsBoundByAccessibilityElement.filter { element in
            element.identifier == "eventPriceAdultView"
        }
        XCTAssertTrue(eventPriceAdultView[0].label == "Adult Ticket")
        XCTAssertTrue(eventPriceAdultView[1].label == "From £29.75")

        let eventPriceChildView = app.staticTexts.allElementsBoundByAccessibilityElement.filter { element in
            element.identifier == "eventPriceChildView"
        }
        XCTAssertTrue(eventPriceChildView[0].label == "Child Ticket")
        XCTAssertTrue(eventPriceChildView[1].label == "From £13.00")
    }
    
    func testNavigationBar(_ app:XCUIApplication, type:String)  {
        
 
        switch type {
        case "normal":
            XCTAssertTrue(app.descendants(matching: .staticText)["navigationBarTitleLabel"].label == "VISIT LONDON")
            
        case "eventDetail":
            XCTAssertTrue(app.descendants(matching: .staticText)["eventDetailNavigationBarTitleLabel"].label == "The Lion King: The Musical ar the Lyceum Theatre")
            
            XCTAssertNotNil(app.descendants(matching: .button)["eventDetailNavigationBarBackButton"])
            XCTAssertNotNil(app.descendants(matching: .button)["eventDetailNavigationBarShareButton"])
            XCTAssertNotNil(app.descendants(matching: .button)["eventDetailNavigationMapButton"])
                    
        default:
            print(type)
        }
        

    }
    
    private func navigationBar(_a app:XCUIApplication, identifier:String)  {
        
    }
    
    private func tapTabBar(_ app:XCUIApplication, labelString: String)  {
        
        if let tabBarButton = app.tabBars.buttons.allElementsBoundByIndex.filter({ element in
            element.label == labelString
        }).first {
            tabBarButton.tap()
        } else {
            print("No button found")
        }
    }
}
