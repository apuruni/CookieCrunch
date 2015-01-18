import CookieCrunch
import XCTest

class Array2DTests : XCTestCase {
    func testSubscript() {
        var stringArray2D = Array2D<String>(columns: 3, rows: 4)
        XCTAssertNil(stringArray2D[0, 0])
        XCTAssertNil(stringArray2D[1, 2])

        stringArray2D[1, 2] = "test"
        XCTAssertNotNil(stringArray2D[1, 2])
        XCTAssertEqual(stringArray2D[1, 2]!, "test")
    }
}
