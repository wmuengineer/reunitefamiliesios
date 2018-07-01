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
            <<< TextRow(Constants.Key.FirstName) { row in
                row.title = "First Name"
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
            <<< TextRow(Constants.Key.LastName) { row in
                row.title = "Last Name"
            }
            <<< SegmentedRow<String>(Constants.Key.Gender) { row in
                row.title = "Gender"
                row.options = ["Male", "Female"]
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
            <<< DateRow(Constants.Key.BirthDate) { row in
                row.title = "Birthdate (if known)"
            }
            <<< IntRow(Constants.Key.Age) { row in
                row.title = "Estimated Age"
                row.add(rule: RuleRequired(msg: "Enter \(row.title!)", id: nil))
            }
            <<< TextRow(Constants.Key.OriginCountry) { row in
                row.title = "Country of Origin"
            }
            
        +++ Section("Location Info")
            <<< TextRow(Constants.Key.Location) { row in
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
        RFService.shared.saveChild(
            firstName: values[Constants.Key.FirstName] as? String,
            lastName: values[Constants.Key.LastName] as? String,
            gender: values[Constants.Key.Gender] as? String,
            birthDate: values[Constants.Key.BirthDate] as? Date,
            age: values[Constants.Key.Age] as? Int,
            countryOfOrigin: values[Constants.Key.OriginCountry] as? String,
            location: values[Constants.Key.Location] as? String,
            reuniteStatus: .pending
        )
        { [weak self] error in
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
