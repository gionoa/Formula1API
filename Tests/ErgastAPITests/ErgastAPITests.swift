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
    
    func test_circuit_all_shouldSucceed() {
//        ErgastAPI.circuits(for: nil) { result in
//            switch result {
//            case .success(let circuits):
//                XCTAssert(circuits.count > 0)
//                print(circuits)
//                
//            case .failure(let error):
//                print(error)
//                fatalError()
//            }
//        }
    }
}
