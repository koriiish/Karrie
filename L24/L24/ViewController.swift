//
//  ViewController.swift
//  L24
//
//  Created by Наталья Мазур on 15.02.24.
//
// Пользователь может создавать новые события, указывая заголовок, описание, и дату события.

import UIKit

class ViewController: UIViewController {
    
//    let events = [Event(title: "Title", description: "Description", date: "2024/02/15")]
    var timeZonesArray: Array<Timezone> = []
    
    lazy var tableView: UITableView = {
    let tableView = UITableView()
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.delegate = self
    tableView.dataSource = self
    return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TODO"
        setupNavigation()
        setupTableView()
        
//        getTimeZone()
    }
    
    private func setupNavigation() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    private func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
        ])
        
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
    }
    
    @objc func addButtonTapped() {
        let newTimezone = Timezone(name: "Minsk", abbr: "GMT+3")
        timeZonesArray.append(newTimezone)
        tableView.reloadData()
    }
    
    func getTimeZone() {
        let knownTimeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
        for timeZones in TimeZone.knownTimeZoneIdentifiers {
            let timeZone = TimeZone(identifier: timeZones)
            if let abbreviation = timeZone?.abbreviation(), let seconds = timeZone?.secondsFromGMT() {
                print ("timeZone: \(timeZones) \nabbreviation: \(abbreviation)\nsecondsFromGMT: \(seconds)\n")
                timeZonesArray.append(Timezone(name: timeZones, abbr: abbreviation))
            }
        }
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timeZonesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        cell.configure(timezone: timeZonesArray[indexPath.row])
        return cell
    }
    
    
}

//MARK: - ТЗ на урок

/*
 Разработать приложение для управления событиями и задачами с поддержкой различных временных зон и возможностью форматирования дат.
 
 Пользователь может создавать новые события, указывая заголовок, описание, и дату события.
 
 Дата события должна быть вводима с использованием календаря и времени, с учетом текущей временной зоны устройства.
 
 События должны отображаться в соответствии с текущей временной зоной устройства.
 
 Пользователь должен иметь возможность просматривать события в различных временных зонах.
 
 Реализовать возможность выбора формата отображения даты и времени.
 
 Дата и время события должны быть форматированы в соответствии с выбранным форматом.
 
 Пользователь может изменять временную зону для отображения событий, учитывая различные географические положения.
 
 При изменении временной зоны события должны автоматически корректироваться в соответствии с новой зоной.
 
 Реализовать возможность установки уведомлений для событий.
 
 Уведомления должны быть настроены с учетом временной зоны пользователя.
 
 Приложение должно поддерживать работу с различными временными зонами и форматами дат, поддержка всех доступных языков.
 
 Данные о событиях должны сохраняться надежно и быть доступными даже после перезапуска приложения.
 
 Данные о событиях должны храниться в безопасной форме, и доступ к ним должен быть ограничен только авторизованным пользователям.
 
 */
