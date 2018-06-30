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
        ref.child("children").childByAutoId().setValue([
            Constants.Keys.OriginCountry: "United States",
            Constants.Keys.BirthDate: Date().formatDate(),
            Constants.Keys.FirstName: "Liam",
            Constants.Keys.LastName: "Jennings",
            Constants.Keys.Location: "Oakland, CA",
            Constants.Keys.AgeMax: 7,
            Constants.Keys.AgeMin: 5,
            Constants.Keys.ReuniteStatus: ReuniteStatus.Pending.rawValue])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

