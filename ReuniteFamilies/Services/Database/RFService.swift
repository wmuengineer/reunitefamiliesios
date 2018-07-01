//
//  RFService.swift
//  ReuniteFamilies
//
//  Created by Scott Doerrfeld on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import Foundation
import FirebaseDatabase

protocol RFServiceable {
    func saveChild(child: Child)
}

class RFService {
    static let shared = RFService()
    
    let ref: DatabaseReference = Database.database().reference()
    
    private init() {}
    
    func saveChild(child: Child, completion: @escaping (Error?) -> Void) {
        ref.child("children").childByAutoId().setValue([
            Constants.Keys.OriginCountry: child.countryOfOrigin,
            Constants.Keys.BirthDate: child.birthdate?.formatDate(),
            Constants.Keys.FirstName: child.firstName,
            Constants.Keys.LastName: child.lastName,
            Constants.Keys.Location: child.location,
            Constants.Keys.Age: child.age,
            Constants.Keys.ReuniteStatus: child.reuiniteStatus.rawValue
        ]) { (error, ref) in
            completion(error)
        }
    }
}
