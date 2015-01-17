//
//  CookieTests.swift
//  CookieCrunch
//
//  Created by Apurune on 2015/01/17.
//  Copyright (c) 2015年 Apurune. All rights reserved.
//

import CookieCrunch
import XCTest

class CookieTests : XCTestCase {
    func testCookieTypeEnum() {
        let cookieType = CookieType.Croissant
        XCTAssertEqual(cookieType.spriteName, "Croissant")
        XCTAssertEqual(cookieType.highLightedSpriteName, "Croissant-Highlighted")
    }
    
    func testCookieTypeEnumRandom() {
        let cookieType = CookieType.random()
        XCTAssertTrue(cookieType.rawValue >= 1 && cookieType.rawValue <= 6)
    }
}

