//
//  LocalizationManagerTests.swift
//  travellondonTests
//
//  Created by Tony Cheung on 24/10/2022.
//

import XCTest

final class LocalizationManagerTests: XCTestCase {

    func testTranslation() {
        
        XCTAssertEqual(localizedString(key: "tabbar_explorer", language: "zh", defaultResult: ""), "探索")
        XCTAssertEqual(localizedString(key: "tabbar_explorer", language: "en", defaultResult: ""), "Explorer")
        XCTAssertEqual(localizedString(key: "nothing", language: "zh", defaultResult: ""), "")
        XCTAssertEqual(localizedString(key: "tabbar_explorer", language: "ru", defaultResult: ""), "")
        
    }
    
    func testFileLoadingUtility() {
        
        XCTAssertThrowsError(try loadFileToJSON("MissingFile.json", type: String.self)) { error in
            XCTAssertEqual(error as? FileLoadingError, FileLoadingError.fileMissingError("Couldn't find MissingFile.json in main bundle."))
        }
        
        XCTAssertNil(try loadFileToJSON("incorrectEventDetailData.json", type: EventDetail.self))

        let eventDetail = try! loadFileToJSON("testingEventDetailData.json", type: EventDetail.self) as! EventDetail
        
    
    }
    
    func testParsor() {
        
    }

}
