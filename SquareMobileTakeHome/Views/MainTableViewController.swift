//
//  MainTableViewController.swift
//  SquareMobileTakeHome
//
//  Created by Sky Roth on 2022-11-09.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    //  MARK: - VARIABLES
    let screenSize: CGRect = UIScreen.main.bounds
        
    
    //  MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        setupUI()
        getEmployeeData()
    }
    
    //  MARK: - VIEWDIDAPPEAR
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    //  MARK: - MAIN FUNCTIONS
    @objc func refresh(_ sender: AnyObject) {
        getEmployeeData()
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
        
        if EmployeeData.parsedEmployees.count == 0 {
            createAlert(title: "Error", message: "No employees can be loaded, please try again later")
        }
    }
    
    func createAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func setupUI() {
        self.refreshControl = UIRefreshControl()
        self.refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl!.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        
        tableView.allowsSelection = false
    }

    // MARK: - TABLEVIEW

    override func numberOfSections(in tableView: UITableView) -> Int {
        return EmployeeData.parsedEmployees.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return EmployeeData.parsedEmployees[section].full_name
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "employeeCell")! as UITableViewCell
        
        //  Clear out the cell before adding new data
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
