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
    
    struct Keys {
        static let OriginCountry = "country_of_origin"
        static let BirthDate = "dob"
        static let FirstName = "first_name"
        static let LastName = "last_name"
        static let Location = "location"
        static let Age = "age"
        static let ReuniteStatus = "reunite_status"
        static let Gender = "gender"
    }

}
