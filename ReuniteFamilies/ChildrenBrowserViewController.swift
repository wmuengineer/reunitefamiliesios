//
//  ChildrenBrowserViewController.swift
//  ReuniteFamilies
//
//  Created by Scott Doerrfeld on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit
import FirebaseDatabase

struct ChildInfo {
    let firstName: String
    let lastName: String
    let country: String
}

class ChildrenBrowserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let CellId = "TextCell"
    var database = [ChildInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()
        let query = ref.child(Constants.Key.Children).queryOrdered(byChild: Constants.Key.LastName)

        query.observeSingleEvent(of: .value, with: { snapshot in
            let enumerator = snapshot.children
            while let rest = enumerator.nextObject() as? DataSnapshot {
                
                if let value = rest.value as? [String: Any], let firstName = value[Constants.Key.FirstName] as? String,
                    let lastName = value[Constants.Key.LastName] as? String,
                    let country = value[Constants.Key.OriginCountry] as? String {
                    self.database.append(ChildInfo(firstName: firstName, lastName: lastName, country: country))
                }
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

extension ChildrenBrowserViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return database.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let data = database[indexPath.row]
        let fullName = "\(data.firstName) \(data.lastName)"
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath)
        cell.textLabel?.text = fullName
        cell.detailTextLabel?.text = data.country
        return cell
    }
}

extension ChildrenBrowserViewController: UITableViewDelegate {
    
}
