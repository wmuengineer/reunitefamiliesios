//
//  ChildrenBrowserViewController.swift
//  ReuniteFamilies
//
//  Created by Scott Doerrfeld on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ChildrenBrowserViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let CellId = "TextCell"
    var database = [ChildInfo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ref = Database.database().reference()
        let query = ref.child(Constants.Key.Children).queryOrdered(byChild: Constants.Key.LastName)
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44

        query.observeSingleEvent(of: .value, with: { snapshot in
            let enumerator = snapshot.children
            while let snap = enumerator.nextObject() as? DataSnapshot {
                guard let value = snap.value as? [String: Any] else { return }
                let birthDateString = value[Constants.Key.BirthDate] as? String ?? ""
                let birthDate = Date.dateFromFormat(birthDateString)
                let info = ChildInfo(
                    firstName: value[Constants.Key.FirstName] as? String,
                    lastName: value[Constants.Key.LastName] as? String,
                    country: value[Constants.Key.OriginCountry] as? String,
                    birthDate: birthDate,
                    location: value[Constants.Key.Location] as? String,
                    ageMax: value[Constants.Key.AgeMax] as? Int,
                    ageMin: value[Constants.Key.AgeMin] as? Int,
                    reuniteStatus: ReuniteStatus(rawValue: value[Constants.Key.ReuniteStatus] as? String ?? ""))
                
                self.database.append(info)
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
        let childInfo = database[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CellId, for: indexPath) as! ChildrenBrowserCell
        cell.configure(with: childInfo)
        return cell
    }
}

extension ChildrenBrowserViewController: UITableViewDelegate {
    
}
