//
//  File.swift
//  Lesson1412
//
//  Created by Карина Дьячина on 14.12.23.
//

import Foundation
import UIKit

class ContactsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        title = "Contacts"
        tabBarItem = UITabBarItem(title: "Contacts", image: nil, tag: 0)
    }
}
