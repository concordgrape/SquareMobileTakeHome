//
//  ExternalConstants.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import Foundation

struct ExternalConstants {
    static let DEFAULT_EMPLOYEES_URL: URL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees.json")!
    static let EMPLOYEES_MALFORMED_URL: URL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json")!
    static let EMPLOYEES_EMPTY_URL: URL = URL(string: "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json")!
}
