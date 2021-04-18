//
//  ViewController.swift
//  POC_ABC
//
//  Created by Sumit_sharma on 17/04/21.
//

import UIKit

class ViewController: UIViewController {
    private var countryRecords: [Country] = []
    private var stateRecords: [State] = []
    private var cityRecords: [City] = []
    private var pickerValue = ""
    @IBOutlet weak private var btn_empImg : UIButton!
    @IBOutlet weak private var btn_save : UIButton!
    @IBOutlet weak private var txt_EmpCode : UITextField!
    @IBOutlet weak private var txt_FirstName : UITextField!
    @IBOutlet weak private var txt_secondName : UITextField!
    @IBOutlet weak private var txt_lastName : UITextField!
    @IBOutlet weak private var txt_Email : UITextField!
    @IBOutlet weak private var txt_number : UITextField!
    @IBOutlet weak private var txt_Country : UITextField!
    
    @IBOutlet weak private var txt_state : UITextField!
    @IBOutlet weak private var txt_city : UITextField!
    @IBOutlet weak private var txt_address : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.makeView_withCornerRadius()
        setPreSetValue()
        self.txt_Country.tag = 1
        self.txt_state.tag = 2
        self.txt_city.tag = 3

        self.txt_city.delegate = self
        self.txt_state.delegate = self
        self.txt_Country.delegate = self
    }
    
    
    private func makeView_withCornerRadius(){
        self.btn_empImg.layer.borderWidth = 1
        self.btn_empImg.clipsToBounds = true
        self.btn_empImg.layer.borderColor = CGColor(gray: 100, alpha: 1)
        self.btn_empImg.layer.cornerRadius = self.btn_empImg.frame.height/2
        self.txt_address.layer.cornerRadius = 10
    }
    
    @IBAction func showDetailPage(_ sender: UIBarButtonItem) {
        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as! DetailsVC
        self.present(vc, animated: true, completion: nil)
    }
    func setPreSetValue(){
       
      
        self.txt_EmpCode.text = ""
        self.txt_FirstName.text = ""
        self.txt_lastName.text = ""
        self.txt_secondName.text = ""
        self.txt_Email.text = ""
        self.txt_number.text = ""
        self.txt_Country.text = ""
        self.txt_state.text = ""
        self.txt_city.text = ""
        self.txt_address.text = ""
        self.btn_save.setImage(nil, for: .normal)
        self.txt_state.isUserInteractionEnabled = false
        self.txt_city.isUserInteractionEnabled = false
        self.txt_Country.isUserInteractionEnabled = true
        self.txt_EmpCode.isUserInteractionEnabled = false
        self.txt_EmpCode.text = UUID().uuidString
    }
    
    @IBAction func save_EmpRecord(_ sender:UIButton){
        if self.btn_empImg.currentImage == nil {
            
        }else if let txt = self.txt_EmpCode.text, txt.isEmpty{
            print("EMP_CODE NOT EMPTY")
        }else if let txt = self.txt_FirstName.text, txt.isEmpty{
            print("FIRST YOU NEED TO ENTER FIRST NAME")
        }else if let txt = self.txt_secondName.text, txt.isEmpty{
            print("FIRST YOU NEED TO ENTER SECOND NAME")
        }else if let txt = self.txt_lastName.text, txt.isEmpty{
            print("LAST NAME IS REQUERED")
        }else if let txt = self.txt_Email.text, txt.isEmpty{
            print("EMAIL IS REQUERED")
        }else if let txt = self.txt_number.text, txt.isEmpty{
            print("PHONE NUMBER IS REQUERED")
        }else if let txt = self.txt_Country.text, txt.isEmpty{
            print("Country NAME IS REQUERED")
        }else if let txt = self.txt_state.text, txt.isEmpty{
            print("STATE NAME IS REQUERED")
        }else if let txt = self.txt_city.text, txt.isEmpty{
            print("CITE NAME IS REQUERED")
        }else if let txt = self.txt_address.text, txt.isEmpty{
            print("ADDRESS NAME IS REQUERED")
        }
        
//
//        let emp_Dic = ["emp_code": self.txt_EmpCode.text!,
//                       "emp_fName":self.txt_FirstName.text!,
//                       "emp_sName":self.txt_secondName.text!,
//                       "emp_lName":self.txt_lastName.text!,
//                       "emp_email":self.txt_Email.text!,
//                       "emp_number":self.txt_number.text!,
//                       "emp_country":self.txt_Country.text!,
//                       "emp_state":self.txt_state.text!,
//                       "emp_city":self.txt_city.text!,
//                       "emp_address":self.txt_address.text!
//        ]
        
        let employee = Employee()
        employee.emp_code = self.txt_EmpCode.text!
        employee.emp_fname = self.txt_FirstName.text!
        employee.emp_sname = self.txt_secondName.text!
        employee.emp_lname = self.txt_lastName.text!
        employee.emp_number = self.txt_number.text!
        employee.emp_email = self.txt_Email.text!
        employee.emp_country = self.txt_Country.text!
        employee.emp_state = self.txt_state.text!
        employee.emp_city = self.txt_city.text!
        employee.emp_address = self.txt_address.text!
        employee.save()
        setPreSetValue()
        print("RCORD SAVE")
    }
    @IBAction func open_Camera(_ sender:UIButton){
        self.openCamerWithNativeAproch()
     
    }
    
    
    private func save_InLocalDB(){
        
    }
}
extension ViewController:UITextFieldDelegate{
    private func addRight_dropdownIcon(){
        let dropArrow = UIImageView(image: #imageLiteral(resourceName: "dropDown"))
        self.txt_state.rightView = dropArrow
        self.txt_city.rightView = dropArrow
        self.txt_Country.rightView = dropArrow
        self.txt_Country.rightViewMode = .always
        self.txt_state.rightViewMode = .always
        self.txt_city.rightViewMode = .always
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //self.view.endEditing(true)
        if textField == self.txt_Country{
            self.getCountryList()
        }else if textField == self.txt_state{
            self.getStateList()
        }else if textField == self.txt_city{
            self.getCityList()
        }else{
            return
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.text = pickerValue
    }
}

//MARK:- NATIV UIImagePickerControllerDelegate
extension ViewController:UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    private func openCamerWithNativeAproch(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        //CAMERA IS NOT AVAIABLE IN SEMULATER
        // make makeara wrking need to uncomment next line and comment uperone line
        // vc.sourceType = .camera
        vc.allowsEditing = true
        vc.delegate = self
        present(vc, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            
            return
        }
        self.btn_empImg.setImage(image, for: .normal)
        // print out the image size as a test
        print(image.size)
    }
    
    
    
}

//GENRAL OPRATIONS
extension ViewController{
    private func getCountryList(){
        self.txt_city.text = ""
        self.txt_state.text = ""
        self.txt_state.isUserInteractionEnabled = false
        self.txt_city.isUserInteractionEnabled = false
        self.loadJson(filename: "Country") { (mode:JSONDATE<Country>?, err:String?) in
            if err == nil{
                self.countryRecords = mode?.Data ?? []
                self.loadPickerDate(field: self.txt_Country)
            }else{
                self.countryRecords = []
            }
        }
    }
    
    private func getStateList(){
        self.txt_city.text = ""
        self.txt_city.isUserInteractionEnabled = false
        self.loadJson(filename: "States") { (mode:JSONDATE<State>?, err:String?) in
            if err == nil{
                let fModel = mode?.Data.filter({$0.country == self.countryRecords.first?.code})
                
                self.stateRecords = fModel ?? []
                self.loadPickerDate(field: self.txt_state)

            }else{
                self.stateRecords = []
            }
        }
    }
    
    private func getCityList(){
        self.loadJson(filename: "Cities") { (mode:JSONDATE<City>?, err:String?) in
            if err == nil{
                let fModel = mode?.Data.filter({$0.state_code == self.stateRecords.first?.code})
                self.cityRecords = fModel ?? []
                self.loadPickerDate(field: self.txt_city)

            }else{
                self.cityRecords = []
            }
        }
    }
}


//NATIVE RECORD PICKER
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func loadPickerDate(field: UITextField) {
        
        
        let UIPicker = UIPickerView()
        UIPicker.tag = field.tag
        UIPicker.delegate = self as UIPickerViewDelegate
        UIPicker.dataSource = self as UIPickerViewDataSource
        //self.view.addSubview(UIPicker)
        //UIPicker.center = self.view.center
        field.inputView = UIPicker
       // field.inputAccessoryView = UIPicker
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView.tag {
        case 1:
            return countryRecords.count
        case 2:
            return stateRecords.count
        case 3:
            return cityRecords.count
        default:
            return 0
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 1:
            return self.countryRecords[row].name
        case 2:
            return self.stateRecords[row].name
        case 3:
            return self.cityRecords[row].name
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 1:
            self.pickerValue = self.countryRecords[row].name
            self.txt_state.isUserInteractionEnabled = true
            self.txt_city.isUserInteractionEnabled = false
            self.txt_city.text = ""
            self.txt_state.text = ""

        case 2:
            self.pickerValue = self.stateRecords[row].name
            self.txt_city.isUserInteractionEnabled = true
        case 3:
            self.pickerValue = self.cityRecords[row].name
        default:
            self.pickerValue = ""
        }
    }
    
}
