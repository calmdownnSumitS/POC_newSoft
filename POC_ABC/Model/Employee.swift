//
//  Employee.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 18/04/21.
//

import Foundation
import SundeedQLite


class Employee: SundeedQLiter {
    var emp_code: String = ""
    var emp_fname: String = ""
    var emp_sname: String = ""
    var emp_lname: String = ""
    var emp_email: String = ""
    var emp_number: String = ""
    var emp_country: String = ""
    var emp_state: String = ""
    var emp_city: String = ""

    var emp_address: String = ""
    required init() {}

    
    

   // required init() {}
    func sundeedQLiterMapping(map: SundeedQLiteMap) {
        self.emp_code <~> map["id"]
        self.emp_fname <~> map["emp_fName"]
        self.emp_sname <~> map["emp_sName"]
        self.emp_lname <~> map["emp_lName"]
        self.emp_email <~> map["emp_email"]
        self.emp_number <~> map["emp_number"]
        self.emp_country <~> map["emp_country"]
        self.emp_state <~> map["emp_state"]
        self.emp_city <~> map["emp_city"]
        self.emp_address <~> map["emp_address"]
       
    }
}
