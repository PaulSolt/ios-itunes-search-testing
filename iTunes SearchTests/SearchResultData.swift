//
//  SearchResultData.swift
//  iTunes SearchTests
//
//  Created by Paul Solt on 8/19/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation


// Command + Option + Shift + V

let goodResultData = """
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
""".data(using: .utf8)!


let badResultData = """
{
    resultCount": 2,
    "results": [
        {
            "trackName": "GarageBand",
            "artistName": "Apple"
        }
        {
            "trackName": "Shortcut: GarageBand Edition",
            "artistName": "Mark Keroles"
        
    ]
}
""".data(using: .utf8)!
