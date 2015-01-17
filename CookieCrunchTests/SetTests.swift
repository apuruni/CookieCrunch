import CookieCrunch
import XCTest

class SetTests: XCTestCase {
    func testAddElement() {
        var set = Set<String>()
        XCTAssertTrue(set.count == 0)
        set.addElement("element 1")
        XCTAssertTrue(set.count == 1)
        set.addElement("element 2")
        XCTAssertTrue(set.count == 2)
        set.addElement("element 1")
        XCTAssertTrue(set.count == 2)
    }
}