//
//  MockDataLoader.swift
//  iTunes SearchTests
//
//  Created by Paul Solt on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
@testable import iTunes_Search

class MockDataLoader: NetworkDataLoader {
    
    // Set these variables before calling loadData()
    var data: Data?
    var error: Error?
    
    // Store the request that is generated, so we can investigate
    // SPY
    var request: URLRequest?
  
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void) {
        
        // can do anything I want to get the data
        // load a file
        // return static results
        // return variables that we "pass in" aka: property dependency injection
        self.request = request
        
        DispatchQueue.main.async {
            completion(self.data, self.error)
        }
    }
    
}
