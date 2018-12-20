import XCTest
@testable import ThriftFinder

final class ThriftFinderTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ThriftFinder().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
