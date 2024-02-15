//
//  ViewController.swift
//  lesson24
//
//  Created by Карина Дьячина on 15.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    let currentDate = Date()
        var components = DateComponents()
        let seconds: TimeInterval = 3600

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let startDate = Date()
                let endDate = Calendar.current.date(byAdding: .day, value: 5, to: startDate)!
                
                components.day = 1
                let minutes = seconds / 60
                let date = Calendar.current.date(from: components)
                print("Текущая дата: \(currentDate)")
                print(date ?? "Не удалось создать дату")
                
                print("В \(seconds) секундах - \(minutes) минут")
                
                let modifyDate = Calendar.current.date(byAdding: components, to: currentDate)
                print(modifyDate)
                
                let oneHourLater = currentDate.addingTimeInterval(seconds)
                let utcTime = Calendar.current.timeZone
                print(currentDate.description)
        
    }


}

