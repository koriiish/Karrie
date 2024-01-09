//
//  AuthView.swift
//  less901customui
//
//  Created by Карина Дьячина on 9.01.24.
//

import UIKit


class AuthViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    @IBAction func loginButton(_ sender: Any) {
    }
}
