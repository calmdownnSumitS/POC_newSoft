//
//  DetailCell.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 18/04/21.
//

import UIKit


class DetailCell: UITableViewCell {
   
    
    @IBOutlet weak var emp_code:UILabel!
    @IBOutlet weak var emp_Fname :UILabel!
    @IBOutlet weak var emp_Sname:UILabel!
    @IBOutlet weak var emp_Lname:UILabel!
    @IBOutlet weak var emp_email:UILabel!
    @IBOutlet weak var emp_number:UILabel!
    @IBOutlet weak var emp_counry:UILabel!
    @IBOutlet weak var emp_state:UILabel!
    @IBOutlet weak var emp_city:UILabel!
    @IBOutlet weak var emp_address:UILabel!

    var emp : Employee? = nil {
        didSet{
            self.emp_code.text = emp?.emp_code
            self.emp_Fname.text = emp?.emp_fname
            self.emp_Sname.text = emp?.emp_sname
            self.emp_Lname.text = emp?.emp_lname
            self.emp_email.text = emp?.emp_email
            self.emp_number.text = emp?.emp_number
            self.emp_counry.text = emp?.emp_country
            self.emp_state.text = emp?.emp_state
            self.emp_city.text = emp?.emp_city
            self.emp_address.text = emp?.emp_address


        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
