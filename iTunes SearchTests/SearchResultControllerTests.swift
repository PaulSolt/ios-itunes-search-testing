//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Paul Solt on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import XCTest

@testable import iTunes_Search

/*
 
 What dependencies do you see?
 - URLSession
 - ResultType
 - URL
 - URLRequest
 - searchTerm
 - URLQueryItem
 
 What do you want to test/verify?
 - Are we decoding properly?
 - Are we constructing the URL correctly?
 - SearchResults should not be empty?
 - empty? Nothing to return / something was wrong
 - Fails elegantly with bad data
 - Is our completion handler always called?
 - Feature: provide the error back to the caller
 */

class SearchResultControllerTests: XCTestCase {
    
    
    
    func testSearchResultController() {
        
        let controller = SearchResultController()
        let completionCalled = expectation(description: "SearchResultsReturned")
        controller.performSearch(for: "GarageBand", resultType: .software) {
            completionCalled.fulfill()
        }
        
        waitForExpectations(timeout: 5) { (error) in
            //XCTFail()
            XCTAssertTrue(controller.searchResults.count > 0)
        }
        
//        wait(for: [completionCalled], timeout: 5)
//        XCTFail()
    }
    
    func testSearchResultForGoodData() {
        // URLSession dependency is locking us into Async / delayed logic
        
        let mock = MockDataLoader()
        mock.data = goodData
        let controller = SearchResultController(dataLoader: mock)
        let completitionExpectation = expectation(description: "Async Completition")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            completitionExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 5)  // Can omit the completion handler if it times out
        
        // Add your test cases after the wait, which will synchronously wait until async operation finishes
        
        // AssertEqual(expected, actual)
        XCTAssertEqual(2, controller.searchResults.count)
        
        XCTAssertEqual("GarageBand", controller.searchResults[0].title)
        XCTAssertEqual("Apple", controller.searchResults[0].artist)
    }
}
