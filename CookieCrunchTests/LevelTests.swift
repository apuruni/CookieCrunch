import CookieCrunch
import XCTest

class LevelTests: XCTestCase {
    func testShuffle() {
        let level = Level(filename: "Levels/Level_1")
        // XCTAssertEqual(level.cookieCount, 81)
        println("calling shuffle")
        level.shuffle()
        // XCTAssertEqual(level.cookieCount, 81)
    }
}