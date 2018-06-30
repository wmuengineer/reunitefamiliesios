//
//  FirstViewController.swift
//  ReuniteFamilies
//
//  Created by Scott Doerrfeld on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit
import FirebaseDatabase


class FirstViewController: UIViewController {
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        ref.child(Constants.Key.Children).childByAutoId().setValue([
            Constants.Key.OriginCountry: "United States",
            Constants.Key.BirthDate: Date().formatDate(),
            Constants.Key.FirstName: "Liam",
            Constants.Key.LastName: "Jennings",
            Constants.Key.Location: "Oakland, CA",
            Constants.Key.AgeMax: 7,
            Constants.Key.AgeMin: 5,
            Constants.Key.ReuniteStatus: ReuniteStatus.Pending.rawValue])
    }
}
