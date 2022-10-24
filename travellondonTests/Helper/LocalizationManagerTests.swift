//
//  LocalizationManagerTests.swift
//  travellondonTests
//
//  Created by Tony Cheung on 24/10/2022.
//

import XCTest

final class LocalizationManagerTests: XCTestCase {

    func testTranslation() throws {
        
        XCTAssertEqual(localizedString(key: "tabbar_explorer", language: "zh", defaultResult: ""), "探索")
        XCTAssertEqual(localizedString(key: "tabbar_explorer", language: "en", defaultResult: ""), "Explorer")
        XCTAssertEqual(localizedString(key: "nothing", language: "zh", defaultResult: ""), "")
        XCTAssertEqual(localizedString(key: "tabbar_explorer", language: "ru", defaultResult: ""), "")
    }

}
