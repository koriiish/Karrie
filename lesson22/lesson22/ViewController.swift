//
//  ViewController.swift
//  lesson22
//
//  Created by Карина Дьячина on 6.02.24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!

    var countryArray = ["Belarus", "Russia", "USA", "Canada", "Vietnam"]
    var phoneCodes = ["+375", "+7", "+1", "+49", "+20"]
    var flags = ["🇧🇾","🇷🇺","🇺🇸", "🇨🇦", "🇻🇳"]
    var selectedCountryIndex: Int?
    
    lazy var pickerView: UIPickerView = {
            let picker = UIPickerView()
            picker.delegate = self
            picker.dataSource = self
            return picker
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        setupTextField()
        
    }

    func setupTextField() {
        textField.inputView = pickerView
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: true)
        
        textField.inputAccessoryView = toolbar
    }
    
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
    }
    
    func updateTextField() {
        if let selectedCountryIndex = selectedCountryIndex {
            let phoneCode = phoneCodes[selectedCountryIndex]
            let flags = flags[selectedCountryIndex]
            let countryArray = countryArray[selectedCountryIndex]
            textField.text = "\(flags) \(phoneCode)"
        }
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
       return countryArray[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountryIndex = row
        updateTextField()
    }
    
    
}
