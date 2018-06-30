//
//  ChildrenBrowserCell.swift
//  ReuniteFamilies
//
//  Created by Jennifer Jennings on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import UIKit

class ChildrenBrowserCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(with info: ChildInfo) {
        
        var age: String? {
            var a = info.ageMin == nil ? "" : "\(info.ageMin!)"
            a += info.ageMin == nil || info.ageMax == nil ? "" : " - "
            a += info.ageMax == nil ? "" : "\(info.ageMax!)"
            if a == "" { return nil }
            return a
        }
        
        let nameAttributes: [NSAttributedStringKey: Any] = [.font: UIFont.boldSystemFont(ofSize: 18), .foregroundColor: UIColor.black]
        let otherAttributes: [NSAttributedStringKey: Any] = [.font: UIFont.systemFont(ofSize: 16), .foregroundColor: UIColor.darkGray]
        
        let leftAtt = NSMutableAttributedString()
        if let fullName = info.fullName {
            leftAtt.append(NSAttributedString(string: "\(fullName)\n", attributes: nameAttributes))
        }
        if let birthDate = info.birthDate {
            leftAtt.append(NSAttributedString(string: "Birth date: \(birthDate.formatDate())\n", attributes: otherAttributes))
        }
        if let age = age {
            leftAtt.append(NSAttributedString(string: "Age: \(age)\n", attributes: otherAttributes))
        }
        textLabel?.attributedText = leftAtt
        
        let rightAtt = NSMutableAttributedString()
        if let country = info.country {
            rightAtt.append(NSAttributedString(string: "\(country)\n", attributes: nameAttributes))
        }
        if let location = info.location {
            rightAtt.append(NSAttributedString(string: "\(location)\n", attributes: otherAttributes))
        }
        if let reuniteStatus = info.reuniteStatus {
            rightAtt.append(NSAttributedString(string: "Status: \(reuniteStatus.rawValue.capitalized)\n" , attributes: otherAttributes))
        }
        detailTextLabel?.attributedText = rightAtt
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
