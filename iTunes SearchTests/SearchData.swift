//
//  SearchData.swift
//  iTunes SearchTests
//
//  Created by Paul Solt on 9/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation



let goodData = """
{
  "resultCount": 2,
  "results": [
        {
          "trackName": "GarageBand",
          "artistName": "Apple"
        },
        {
          "trackName": "Shortcut: GarageBand Edition",
          "artistName": "Mark Keroles"
        }
    ]
}
""".data(using: .utf8)