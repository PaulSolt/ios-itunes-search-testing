//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Paul Solt on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    // What data do I need to get?
    // What do I need to provide?
    
    func loadData(with request: URLRequest, completion: @escaping (Data?, Error?) -> Void)
}
