//
//  ViewController.swift
//  AlertAndPickers
//
//  Created by berdy on 04.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var buttonLocalize: UIButton!
    
    
    let pickerViewData = ["Picture 1", "Picture 2", "Picture 3", "Picture 4", "Picture 5", "Picture 6"]
    let pickerViewImage = ["1", "2", "3", "4", "5", "6"]
    
    lazy var pickerView: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        return picker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
                textFieldSettings()
        
        
        //        DispatchQueue.main.async {
        //                    self.showCloseAlert(endAction: .init(title: "Alert with 2 options", body: {
        //                        //
        //                    }), title: "Alert")
        //                }
        
        
//        DispatchQueue.main.async {
//            self.classicActionSheet()
//        }
    }
    @IBAction func pickPhotoButtonTapped(_ sender: UIButton) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    func textFieldSettings() {
        textField.inputView = pickerView
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(doneButtonTapped))
        toolbar.setItems([doneButton], animated: false)
        
        textField.inputAccessoryView = toolbar
    }
    
    func classicAlert() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Default", style: .default, handler: { _ in
            print("Default")
            self.handlerAlert()
        }))
        alert.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: { _ in
            print("Destructive")
            self.handlerAlert()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            print("Cancel")
            self.handlerAlert()
        }))
        
        self.present(alert, animated: true)
    }
    
    func handlerAlert() {
        classicAlert()
    }
    
    func classicActionSheet() {
        let alert = UIAlertController(title: "Title", message: "Message", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Default", style: .default, handler: { _ in
            print("Default")
            self.classicActionSheet()
        }))
        alert.addAction(UIAlertAction(title: "Destructive", style: .destructive, handler: { _ in
            print("Destructive")
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("Cancel")
        }))
        self.present(alert, animated: true)
        
    }
    
    static func simpleAlert(title: String?, message: String?, completion: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion?()
        }
        
        alertController.addAction(okAction)
        return alertController
    }
    
    
    static func alertWithOkAndCancel(title: String?, message: String?, okCompletion: (() -> Void)? = nil, cancelCompletion: (() -> Void)? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel) { _ in
            cancelCompletion?()
        }
        
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            okCompletion?()
        }
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        return alertController
    }
    
    static func actionSheet(title: String?, message: String?, actions: [UIAlertAction]) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        
        for action in actions {
            alertController.addAction(action)
        }
        
        return alertController
    }
    
    func showCloseAlert(endAction: ViewAction, title: String) {
        let leftAction = UIAlertAction(
            title: "OK",
            style: .default,
            handler: { _ in
                endAction.body?()
            }
        )
        
        let rightAction = UIAlertAction(
            title: "Cancel",
            style: .cancel) { _ in
                //
            }
        let alert = UIAlertController.make(
            title: title,
            message: nil,
            leftAction: leftAction,
            rightAction: rightAction
        )
        present(alert, animated: true, completion: nil)
    }
    
    private func deletePressed() {
        
        let alert = UIAlertController.make(
            title: "Delete",
            message: "Delete",
            rightAction: .makeDefault(
                title: "Delete",
                handler: { [weak self] in
                    //
                }
            )
        )
        
        present(alert, animated: true, completion: nil)
    }
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //колво барабанов
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    //ниже для добавления картинки
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerViewItem = UIView()
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        imageView.image = UIImage(named: pickerViewImage[row])
        pickerViewItem.addSubview(imageView)
        
        let label = UILabel(frame: CGRect(x: 40, y: 0, width: 200, height: 30))
        label.text = pickerViewData[row]
        pickerViewItem.addSubview(label)
        
        return pickerViewItem
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        imageView.image = UIImage(named: pickerViewImage[row])
    }
    
    @objc func doneButtonTapped() {
        textField.resignFirstResponder()
    }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            imageView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
