//
//  ViewController.swift
//  TextandNotification
//
//  Created by Карина Дьячина on 18.01.24.
//

import UIKit

class ViewController: UIViewController {

    let characterLimit = 20
    let notificationName = Notification.Name("MyNotification")
    let notificationExample = NotificationCenterExample()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        notificationExample.subscribeToNotification()
        notificationExample.postNotification()
      // setupTextField()
      //  setupTextView()
       // buttonSetupView()
        setupNotifications()
        
    }
    func setupTextField() {
            let iconTextField = IconTextField(frame: CGRect(x: 20, y: 100, width: 200, height: 40))
            iconTextField.placeholder = "Введите текст"
        //    iconTextField.setIcon(UIImage(named: "chat-bubble")!)
            
            iconTextField.delegate = self
            iconTextField.borderStyle = .roundedRect
            iconTextField.keyboardType = .emailAddress
            iconTextField.textAlignment = .left
            iconTextField.autocorrectionType = .yes
            iconTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
            
    //        change border textfield
            iconTextField.backgroundColor = UIColor.lightGray
            iconTextField.layer.cornerRadius = 8
            iconTextField.layer.borderWidth = 1.5
            iconTextField.layer.borderColor = UIColor.darkGray.cgColor
            
            
            view.addSubview(iconTextField)
        }
    func setupTextView() {
            let textView = UITextView(frame: CGRect(x: 50, y: 200, width: 200, height: 400))
            textView.delegate = self
            textView.textContainer.maximumNumberOfLines = 100
            textView.textContainer.lineBreakMode = .byTruncatingTail
            textView.layer.cornerRadius = 8
            textView.layer.borderWidth = 1.5
            textView.layer.borderColor = UIColor.darkGray.cgColor
            textView.layer.backgroundColor = UIColor.lightGray.cgColor
            textView.textAlignment = .center
            textView.autocorrectionType = .yes
            
            view.addSubview(textView)
        }
    func buttonSetupView() {
            let button = UIButton(type: .system)
            button.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
            
            button.setTitle("Press", for: .normal)
            
            button.setTitle("Highlighted", for: .highlighted)
            
            button.setTitle("Disabled", for: .disabled)
            
            button.setTitle("Selected", for: .selected)
            
            button.setTitleColor(UIColor.blue, for: .normal)
            button.setTitleColor(UIColor.red, for: .highlighted)
            button.setTitleColor(UIColor.gray, for: .disabled)
            button.setTitleColor(UIColor.green, for: .selected)
            
         //   button.setImage(UIImage(named: "chat-bubble"), for: .normal)
            
            view.addSubview(button)
        }
    
    func setupNotifications() {
        
      //  NotificationCenter.default.
        
            NotificationCenter.default.post(name: notificationName, object: nil)
            
            let userInfo: [AnyHashable: Any] = ["key": "value"]
            NotificationCenter.default.post(name: notificationName, object: nil, userInfo: userInfo)
            
            
            NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: notificationName, object: nil)
            
            NotificationCenter.default.addObserver(self, selector: #selector(handleNotificationWithData(_:)), name: notificationName, object: nil)
            
            
            NotificationCenter.default.removeObserver(self) //удалит все
            
            NotificationCenter.default.removeObserver(self, name: notificationName, object: nil) // удалит нотификайшн нейм
        }
    @objc func handleNotification() {
            print("Уведомление получено")
        }
        
    @objc func handleNotificationWithData(_ notification: Notification) {
            if let userInfo = notification.userInfo {
                print("Уведомление с данными: \(userInfo)")
            }
        }

}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let currentText = textField.text else { return true }
        let newLength = currentText.count + string.count - range.length
        return newLength <= characterLimit
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        print("Текст изменен: \(textField.text ?? "")")
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Начало редактирования текстового поля")
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Завершение редактирования текстового поля")
    }
}
extension ViewController: UITextViewDelegate {
//    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
//        let currentText = textView.text as NSString
//        let newText = currentText.replacingCharacters(in: range, with: text)
//        return newText.count <= characterLimit
//    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        print("Начало редактирования текстового поля")
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        print("Завершение редактирования текстового поля")
    }
    
    func textViewDidChange(_ textView: UITextView) {
        print("Текст изменен: \(textView.text)")
    }
}

class IconTextField: UITextField {
    let iconImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 15, height: 15))

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    private func setupUI() {
        iconImageView.contentMode = .scaleAspectFit
        leftView = iconImageView
        leftViewMode = .always
    }

    func setIcon(_ image: UIImage) {
        iconImageView.image = image
    }
}

class NotificationCenterExample {
    static let notificationName = Notification.Name("MyNotification")

    func postNotification() {
        NotificationCenter.default.post(name: NotificationCenterExample.notificationName, object: nil)
    }

    func subscribeToNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification), name: NotificationCenterExample.notificationName, object: nil)
    }

    @objc func handleNotification() {
        print("Уведомление получено")
    }
}
