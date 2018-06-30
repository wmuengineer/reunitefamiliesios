//
//  Date+Reunite.swift
//  ReuniteFamilies
//
//  Created by Jennifer Jennings on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit

extension Date {
    
    func formatDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/YYYY"
        return formatter.string(from: self)
    }
}
