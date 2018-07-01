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
    @IBOutlet weak var uploadChildButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadChildButton.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        uploadChildButton.setTitle(Strings.UploadChild, for: .normal)
        uploadChildButton.addTarget(self, action: #selector(tappedUploadChildButton), for: .touchUpInside)
    }
    
    @objc func tappedUploadChildButton() {
        let nav = UINavigationController(rootViewController: UploadChildForm())
        present(nav, animated: true)
    }
}

