//
//  UploadChildForm.swift
//  ReuniteFamilies
//
//  Created by Scott Doerrfeld on 6/30/18.
//  Copyright © 2018 Scott Doerrfeld. All rights reserved.
//

import Foundation
import Eureka

class UploadChildForm: FormViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = Strings.UploadChild
        
        form +++ Section("Child Info")
            <<< TextRow(Constants.Keys.FirstName) { row in
                row.title = "First Name"
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
            <<< TextRow(Constants.Keys.LastName) { row in
                row.title = "Last Name"
            }
            <<< SegmentedRow<String>(Constants.Keys.Gender) { row in
                row.title = "Gender"
                row.options = ["Male", "Female"]
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
            <<< DateRow(Constants.Keys.BirthDate) { row in
                row.title = "Birthdate (if known)"
            }
            <<< IntRow(Constants.Keys.Age) { row in
                row.title = "Estimated Age"
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
            <<< TextRow(Constants.Keys.OriginCountry) { row in
                row.title = "Country of Origin"
            }
            
        +++ Section("Location Info")
            <<< TextRow(Constants.Keys.Location) { row in
                row.title = "Facility Location"
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
        
        +++ Section()
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Submit"
            }
            .onCellSelection { [weak self] (cell, row) in
                self?.validateAndSubmit()
            }
            <<< ButtonRow() { (row: ButtonRow) -> Void in
                row.title = "Cancel"
            }
            .onCellSelection { [weak self] (cell, row) in
                self?.close()
            }
    }
    
    func validateAndSubmit() {
        let errors = form.validate()
        guard errors.isEmpty else {
            showAlert(errors.first!.msg)
            return
        }
        
        let values = form.values()
        let child = Child(
            firstName: values[Constants.Keys.FirstName] as? String,
            lastName: values[Constants.Keys.LastName] as? String,
            gender: values[Constants.Keys.Gender] as? String,
            birthdate: values[Constants.Keys.BirthDate] as? Date,
            age: values[Constants.Keys.Age] as? Int,
            countryOfOrigin: values[Constants.Keys.OriginCountry] as? String,
            location: values[Constants.Keys.Location] as? String,
            reuiniteStatus: .Pending
        )
        
        RFService.shared.saveChild(child: child) { [weak self] error in
            guard let strongSelf = self else { return }
            if error == nil {
                strongSelf.showAlert(Strings.SaveSuccess) {
                    strongSelf.close()
                }
            }
            else {
                strongSelf.showAlert(Strings.SaveFail) {
                    strongSelf.close()
                }
            }
        }
    }
    
    func close() {
        dismiss(animated: true, completion: nil)
    }
    
    func showAlert(_ message: String, handler: (() -> ())? = nil) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in handler?() }))
        present(alert, animated: true, completion: nil)
    }
}
