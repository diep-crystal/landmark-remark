//
//  PopupSaveLocationTest.swift
//  Landmark-remarkTests
//
//  Created by Diep Nguyen on 3/29/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import XCTest
@testable import Landmark_remark

class PopupSaveLocationTest: XCTestCase {

    let viewModel = PopupSaveLocationViewModel()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        viewModel.model = AddLocationModel(username: "diep", longitude: "21.054399", latitude: "105.802454", note: "Test")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testValidationData() {
        viewModel.validateCompleted?.subcribe(hdl: { (isValid) in
            XCTAssert(isValid, "Data is not valid")
        })
        
        viewModel.validateData()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
