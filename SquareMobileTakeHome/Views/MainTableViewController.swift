//
//  MainTableViewController.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    let screenSize: CGRect = UIScreen.main.bounds
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        getEmployeeData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    @objc func refresh(_ sender: AnyObject) {
        getEmployeeData()
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    func setupUI() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        tableView.allowsSelection = false
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return EmployeeData.parsedEmployees.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return EmployeeData.parsedEmployees[section].full_name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell")! as UITableViewCell
        
        cell.textLabel!.text = ""
        cell.imageView?.image = UIImage()
        cell.detailTextLabel!.text = ""
        
        cell.detailTextLabel?.textColor = .gray
        
        switch indexPath.row {
        case 0:
            cell.textLabel!.text = EmployeeData.parsedEmployees[indexPath.section].team
            cell.detailTextLabel!.text = EmployeeTitleConstants.TEAM
        case 1:
            cell.textLabel!.text = EmployeeData.parsedEmployees[indexPath.section].biography
            cell.detailTextLabel!.text = EmployeeTitleConstants.BIOGRAPHY
        case 2:
            cell.imageView?.image = EmployeeData.parsedEmployees[indexPath.section].photo_url!
        default:
            break
        }
            
        return cell
    }
}
