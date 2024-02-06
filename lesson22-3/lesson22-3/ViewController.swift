//
//  ViewController.swift
//  lesson22-3
//
//  Created by Карина Дьячина on 6.02.24.
//

import UIKit

class ViewController: UIViewController {

    var avatarView = UIImageView()
    
    var nameLabel = {
        let label = UILabel()
        label.text = "Karrie D"
        label.textColor = .black
        label.font = UIFont(name: "Kefa", size: 30)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAvatarView()
        setupLabel()
        
    }
    private func setupAvatarView() {
        avatarView.frame = CGRect(x: 30, y: 120 , width: 130, height: 130)
        
        avatarView.layer.cornerRadius = 65
        
        avatarView.image = UIImage(systemName: "camera.on.rectangle")
        avatarView.layer.borderColor = UIColor.black.cgColor
        avatarView.layer.borderWidth = 1
        avatarView.contentMode = .scaleAspectFill
        avatarView.clipsToBounds =  true
        let gestureHandler = UITapGestureRecognizer(target: self, action: #selector(avatarTapped))
        avatarView.addGestureRecognizer(gestureHandler)
        avatarView.isUserInteractionEnabled = true
        
        view.addSubview(avatarView)
    }
    
    private func setupLabel() {
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: avatarView.rightAnchor, constant: 25),
            nameLabel.topAnchor.constraint(equalTo: avatarView.topAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            nameLabel.widthAnchor.constraint(equalToConstant: 200)
        ])
    }

    @objc func avatarTapped() {
        classicActionSheet()
    }
    
    func classicActionSheet() {
            let alert = UIAlertController(title: "Add photo from Gallery", message: "Do you want to add photo", preferredStyle: .actionSheet)
            alert.addAction(UIAlertAction(title: "Open Gallery", style: .default, handler: { _ in
                print("Default")
               self.pickPhotoButtonTapped()
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
                print("Cancel")
             //   self.classicActionSheet()
            }))
            self.present(alert, animated: true)
            
        }
    
    func pickPhotoButtonTapped() {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            
            present(imagePicker, animated: true, completion: nil)
        }
}

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            avatarView.image = pickedImage
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}


