import XCTest
@testable import ErgastAPI

final class ErgastAPITests: XCTestCase {
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertTrue(true)
    }

    static var allTests = [(String, ErgastAPITests)]()
        
    func test_raceSchedule_forGivenYear_shouldSucceed() {
        let sut = Path.raceSchedule.urlPath(for: .year(2018))
        
        print(sut)
        XCTAssertEqual(sut, "/api/f1/2018.json")
    }
    
    func test_raceResults_forGivenYear_shouldSucceed() {
        let sut = Path.raceResults.urlPath(for: .year(2018))
        
        print(sut)
        XCTAssertEqual(sut, "/api/f1/2018/results.json")
    }
}
