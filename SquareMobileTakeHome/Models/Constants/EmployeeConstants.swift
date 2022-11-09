//
//  EmployeeConstants.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import Foundation

//  Variable names retrieved from the JSON file
struct EmployeeConstants {
    static let FULL_NAME: String = "full_name"
    static let BIOGRAPHY: String = "biography"
    static let PHOTO_URL_SMALL: String = "photo_url_small"
    static let TEAM: String = "team"
}

//  Nicely formatted version of the variables retrieved from the JSON file (for tableview)
struct EmployeeTitleConstants {
    static let FULL_NAME: String = "Full Name"
    static let BIOGRAPHY: String = "Summary"
    static let PHOTO_URL_SMALL: String = "Photo URL"
    static let TEAM: String = "Team"
}
