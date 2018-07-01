//
//  RFService.swift
//  ReuniteFamilies
//
//  Created by Scott Doerrfeld on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import Foundation
import FirebaseDatabase

class RFService {
    static let shared = RFService()
    
    let ref: DatabaseReference = Database.database().reference()
    
    private init() {}
    
    func saveChild(firstName: String?, lastName: String?, gender: String?, birthDate: Date?, age: Int?, countryOfOrigin: String?, location: String?, reuniteStatus: ReuniteStatus, completion: @escaping (Error?) -> Void) {
        ref.child("children").childByAutoId().setValue([
            Constants.Key.OriginCountry: countryOfOrigin,
            Constants.Key.BirthDate: birthDate?.formatDate(),
            Constants.Key.FirstName: firstName,
            Constants.Key.LastName: lastName,
            Constants.Key.Location: location,
            Constants.Key.Age: age,
            Constants.Key.ReuniteStatus: reuniteStatus.rawValue
        ]) { (error, ref) in
            completion(error)
        }
    }
}
