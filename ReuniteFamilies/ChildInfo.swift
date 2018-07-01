//
//  ChildInfo.swift
//  ReuniteFamilies
//
//  Created by Jennifer Jennings on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit

struct ChildInfo {
    let firstName: String?
    let lastName: String?
    let country: String?
    let birthDate: Date?
    let location: String?
    let ageMax: Int?
    let ageMin: Int?
    let reuniteStatus: ReuniteStatus?
    
    var fullName: String? {
        var name = firstName ?? ""
        name += firstName == nil || lastName == nil ? "" : " "
        name += lastName ?? ""
        if name == "" { return nil }
        return name
    }
}
