//
//  Result.swift
//  BucketList
//
//  Created by Chris Wu on 6/14/20.
//  Copyright © 2020 Chris Wu. All rights reserved.
//

import Foundation
import SwiftUI

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
