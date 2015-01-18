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
