//
//  Landmark_serviceTest.swift
//  Landmark-remarkTests
//
//  Created by Diep Nguyen on 3/29/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import XCTest
@testable import Landmark_remark

class Landmark_serviceTest: XCTestCase {

    var service: LandmarkService?
    
    override func setUp() {
        super.setUp()
        service = LandmarkService()
    }

    override func tearDown() {
        service = nil
        super.tearDown()
    }

    func testLoadLocations() {
        
        //Given an api instant
        guard let service = service else {
            return
        }
        
        // When fetch locations data
        let expect = XCTestExpectation(description: "callback")
        
        service.getLocations().cloudResponse { (collection: LocationCollection) in
            expect.fulfill()
            collection.objectList.forEach({ (model: LocationModel) in
                XCTAssertNotNil(model.locationID)
            })
            }.cloudError { (msgErr, code: Int?) in
                expect.fulfill()
                XCTAssert(code != 1, msgErr)
        }
        
        wait(for: [expect], timeout: 3.0)
    }
    
    func testAddNewLocation() {
        
        //Given an api instant
        guard let service = service else {
            return
        }
        
        let newModel = AddLocationModel(username: "diep", longitude: "21.054399", latitude: "105.802454", note: "Test")
        
        // When fetch locations data
        let expect = XCTestExpectation(description: "callback")
        
        service.addNewLocation(model: newModel).cloudResponse { (emptyObject) in
            expect.fulfill()
            XCTAssert(true, "Request success")
            }.cloudError { (errorMsg: String, code: Int?) in
                expect.fulfill()
                XCTAssert(code != 1, errorMsg)
        }
        wait(for: [expect], timeout: 3.0)
    }

}
