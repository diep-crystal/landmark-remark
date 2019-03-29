//
//  Landmark_searchTest.swift
//  Landmark-remarkTests
//
//  Created by Diep Nguyen on 3/29/19.
//  Copyright © 2019 Diep Nguyen. All rights reserved.
//

import XCTest
@testable import Landmark_remark

class Landmark_searchTest: XCTestCase {

    let viewModel = SearchLandmarkViewModel()
    var mockOriginalList = [LocationModel]()
    override func setUp() {
        super.setUp()
       
        mockOriginalList.append(LocationModel(data: ["username": "user 1", "note": "Test address hanoi"]))
        mockOriginalList.append(LocationModel(data: ["username": "haha 1", "note": "singapore address"]))
        mockOriginalList.append(LocationModel(data: ["username": "test 2", "note": "landmark 72"]))
        mockOriginalList.append(LocationModel(data: ["username": "anyuser 1", "note": "83 trung kinh"]))
        mockOriginalList.append(LocationModel(data: ["username": "duy test 5", "note": "Test address in hanoi"]))
        mockOriginalList.append(LocationModel(data: ["username": "diep tes 45", "note": "Test address"]))
        
        viewModel.originalList = mockOriginalList
    }

    override func tearDown() {
        super.tearDown()
    }

    func testSearch() {
        
        //Given
        let inputText = "address"
        
        //When search items from original list
        viewModel.search(inputText: inputText)
        
        XCTAssert(viewModel.searchList?.value?.count == 4, "Incorrect count number")
        
        XCTAssert(viewModel.numberOfItems() == 4, "number of items")
        XCTAssertNotNil(viewModel.itemAt(index: 1))
        
        
    }
}
