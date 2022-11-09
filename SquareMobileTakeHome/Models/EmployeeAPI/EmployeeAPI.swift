//
//  EmployeeAPI.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import Foundation

struct EmployeeData {
    static var parsedEmployees = [Employee]()
}

func getEmployeeData(url: URL = ExternalConstants.DEFAULT_EMPLOYEES_URL) {
    
    var parsedEmployees: [Employee] = []
    
    let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
        guard let data = data else { return }
        do {
            let allContacts = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String : AnyObject]
            if let arrJSON = allContacts["employees"] {
                if arrJSON.count == 0 { return }
                parsedEmployees.removeAll()
                for index in 0...arrJSON.count-1 {
                    let aObject = arrJSON.object(at: index)
                                 
                    guard let result = aObject as? [String:Any] else { return }
                    let entry = Employee(dictionary: result)
                    if (entry == nil) { return }
                    parsedEmployees.append(entry!)
                }
            }
            
            DispatchQueue.main.async {
                //  Return employees sorted alphabetically
                EmployeeData.parsedEmployees = parsedEmployees.sorted { $0.full_name < $1.full_name }
            }
        } catch {
            return
        }
    }

    task.resume()
}
