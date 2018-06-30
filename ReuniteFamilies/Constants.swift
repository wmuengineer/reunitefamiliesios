//
//  Constants.swift
//  ReuniteFamilies
//
//  Created by Jennifer Jennings on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit


enum ReuniteStatus: String {
    case Pending = "pending"
}

struct Constants {
    
    struct Key {
        static let Children = "children"
        static let OriginCountry = "country_of_origin"
        static let BirthDate = "dob"
        static let FirstName = "firstname"
        static let LastName = "lastname"
        static let Location = "location"
        static let AgeMax = "max_age"
        static let AgeMin = "min_age"
        static let ReuniteStatus = "reunite_status"
    }
    

}
