//
//  SquareMobileTakeHomeTests.swift
//  SquareMobileTakeHomeTests
//
//  Created by Sky Roth on 2022-11-09.
//

import XCTest
@testable import SquareMobileTakeHome

class SquareMobileTakeHomeTests: XCTestCase {

    override func setUpWithError() throws {
        // nil
    }

    override func tearDownWithError() throws {
        // nil
    }
    
    func testGetData() {
        XCTAssertNoThrow(getEmployeeData(url: ExternalConstants.EMPLOYEES_MALFORMED_URL))
        XCTAssertNoThrow(getEmployeeData(url: ExternalConstants.EMPLOYEES_EMPTY_URL))
        XCTAssertNoThrow(getEmployeeData(url: ExternalConstants.DEFAULT_EMPLOYEES_URL))
        
        XCTAssertNotNil(EmployeeData.parsedEmployees)
    }
    
    func testGetImgData() {
        XCTAssertNotNil(downloadImage(from: URL(string: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg")!))
        XCTAssertNoThrow(downloadImage(from: URL(string: "https://www.fakewebsite.gov")!))
    }
    
    func testOptionalExtension() {
        XCTAssertNoThrow(try? Double?.unwrap(3))
        XCTAssertNoThrow(try? Double?.unwrap("Hello World"))
        XCTAssertNoThrow(try? String?.unwrap("Hello World"))
    }
}
