//
//  Constants.swift
//  ReuniteFamilies
//
//  Created by Jennifer Jennings on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit

enum ReuniteStatus: String {
    case pending = "pending"
    case unknown = ""
}

struct Constants {
    
    struct Key {
        static let Children = "children"
        static let OriginCountry = "country_of_origin"
        static let BirthDate = "dob"
        static let FirstName = "first_name"
        static let LastName = "last_name"
        static let Location = "location"
        static let Age = "age"
        static let AgeMin = "age_min"
        static let AgeMax = "age_max"
        static let ReuniteStatus = "reunite_status"
        static let Gender = "gender"
    }

}
