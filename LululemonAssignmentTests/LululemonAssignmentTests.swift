//
//  LululemonAssignmentTests.swift
//  LululemonAssignmentTests
//
//  Created by Munro Azumi on 10/13/21.
//

import XCTest
@testable import LululemonAssignment

class LululemonAssignmentTests: XCTestCase {
    
    var garmentVM: GarmentViewModel?

    override func setUpWithError() throws {
        garmentVM = GarmentViewModel()
    }

    override func tearDownWithError() throws {
        garmentVM = nil
    }

    func testSaveGarment() throws {
        garmentVM?.saveGarmentToDB(name: "test")
        garmentVM?.fetchGarmentsFromDB(sort: NSSortDescriptor(key: "creationTime", ascending: true))
        let lastIndex = garmentVM?.getRowCount() ?? 0
        let garmentName = garmentVM?.getGarmentName(index: lastIndex - 1)
        XCTAssertEqual(garmentName, "test")
    }

    func testDeleteGarment() throws {
        garmentVM?.saveGarmentToDB(name: "test")
        garmentVM?.fetchGarmentsFromDB(sort: NSSortDescriptor(key: "creationTime", ascending: true))
        let arrayCountBeforeDelete = garmentVM?.getRowCount() ?? 0
        garmentVM?.deleteGarmentInDB(index: arrayCountBeforeDelete - 1)
        garmentVM?.fetchGarmentsFromDB(sort: NSSortDescriptor(key: "creationTime", ascending: true))
        let arrayCount = garmentVM?.getRowCount()
        XCTAssertEqual(arrayCount, arrayCountBeforeDelete - 1)
    }

}
