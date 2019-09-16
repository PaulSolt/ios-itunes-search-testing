//
//  NetworkDataLoader.swift
//  iTunes Search
//
//  Created by Paul Solt on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation

protocol NetworkDataLoader {
    
    func loadData(with request: URLRequest,
                  completion: @escaping (Data?, Error?) -> Void)
    
    // We can add more functionality
    //    func canParseData(Data?) -> Bool

}
