//
//  SearchResultControllerTests.swift
//  iTunes SearchTests
//
//  Created by Paul Solt on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import XCTest
@testable import iTunes_Search

class SearchResultControllerTests: XCTestCase {
    
    /// QUESTION: What can we test?
    /// * Get search results
    /// * UI tests for search terms should populate the table view
    /// * Searching apps it should return apps, not music (check the enum values)
    /// * Test the URL is what we'd expect for apps, music, software, etc.
    /// * Edge cases
    /// * What happens when there are spaces in the search term, is that being correctly handled?
    /// * What happens with no results? Does the app display appropiate feedback?
    /// * What kinds of errors do we need to handle?
    /// * More tests with access to source code ...
    /// * Generating URL correctly?
    /// * Is the completion handler being called on the "happy day case", errors, etc.? The completion handler is a contract of something that should happen
    
    ///: # What are the dependencies (variables) in this method?
    ///: * URLComponents
    ///: * URLRequest
    ///: URLQueryItems
    ///: * baseURL
    ///: * URLSession

    // Asynchronous logic finishes after the unit test finishes running, which
    // makes it look like our test is passing, when in fact it hasn't finished testing
    // Use an XCTestExpectation to verify something has happened
    
    func testForSomeResults() {
        let controller = SearchResultController()

        // TODO: Add an expectation to prove that we get a result back
        // 1. create expection
        // 2. fulfill()
        // 3. wait for expectation
        
        // XCTestCase
        // XCTestExpectation
        // func expectation(description: String) -> XCTestExpectation
        // func waitForExpectations(timeout: TimeInterval, handler: XCWaitCompletionHandler? = nil)
        
        let downloadedResultsExpectation = expectation(description: "Downloaded Results")
        
        controller.performSearch(for: "GarageBand", resultType: .software) {
            downloadedResultsExpectation.fulfill()
        }
        
        // This line of code makes our following code synchronous
        waitForExpectations(timeout: 5) { (error) in
            if let error = error {
                print("Error: \(error)")
            }
        }
        
//        print(controller.searchResults)
        XCTAssertTrue(controller.searchResults.count > 0)
    }
    
    
    func testSearchResultsForGoodData() {
        let mockDataLoader = MockDataLoader()
        
        mockDataLoader.data = goodResultData
        mockDataLoader.error = nil
        
        // Use depedency injection
        
        let controller = SearchResultController(dataLoader: mockDataLoader)
        let searchExpectation = expectation(description: "Waiting for search results")
        controller.performSearch(for: "Garage Band", resultType: .software) {
            // async
            
            searchExpectation.fulfill()
        }
        
        // sync
        waitForExpectations(timeout: 1)
        
        // test our assertions
        XCTAssertEqual(2, controller.searchResults.count)
        let firstResult = controller.searchResults.first
        
        XCTAssertEqual("GarageBand", firstResult?.title)
        XCTAssertEqual("Apple", firstResult?.artist)
        
    }
    
    // Test that it fails
    
    enum SearchError: Error, Equatable {
        case badJson
    }
    
    
    func testSearchResultsForBadData() {
        let mockDataLoader = MockDataLoader()
        let error = SearchError.badJson
        
        mockDataLoader.data = badResultData
        mockDataLoader.error = error
        
        // Use depedency injection
        
        let controller = SearchResultController(dataLoader: mockDataLoader)
        let searchExpectation = expectation(description: "Waiting for search results")
        controller.performSearch(for: "Garage Band", resultType: .software) {
            // async
            
            searchExpectation.fulfill()
        }
        
        // sync
        waitForExpectations(timeout: 1)
        
        // test our assertions
        XCTAssertEqual(0, controller.searchResults.count)
        XCTAssertNotNil(controller.error)
//        print(controller.error)
        
//        XCTAssertEqual(error, controller.error!)
    }
    
    
    
    
}
