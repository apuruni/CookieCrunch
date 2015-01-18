import CookieCrunch
import XCTest

class LevelTests: XCTestCase {
    func testShuffle() {
        let level = Level()
        XCTAssertEqual(level.cookieCount, 81)
        level.shuffle()
        XCTAssertEqual(level.cookieCount, 81)
    }
}