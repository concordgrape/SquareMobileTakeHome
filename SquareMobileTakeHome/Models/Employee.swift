//
//  Employee.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import Foundation
import UIKit

//  Outlines the basic profile of an employee
struct Employee {
    
    var full_name: String = ""
    var biography: String = ""
    var photo_url: UIImage?
    var team: String = ""
    
    //  Init the employee with the past dictionary from the URLSession
    init?(dictionary: [String:Any]) {
        do {
            //  If the -1 default value is entered, the parsed data will be incorrect and the data will stop being parsed
            self.full_name = try Optional.unwrap(dictionary[EmployeeConstants.FULL_NAME] ?? -1)
            self.biography = try Optional.unwrap(dictionary[EmployeeConstants.BIOGRAPHY] ?? -1)
            
            let photoURLStr: String = try Optional.unwrap(dictionary[EmployeeConstants.PHOTO_URL_SMALL] ?? -1)
            self.photo_url = downloadImage(from: URL(string: photoURLStr)!)
            
            self.team = try Optional.unwrap(dictionary[EmployeeConstants.TEAM] ?? -1)
        } catch {
            return nil
        }
    }
}
