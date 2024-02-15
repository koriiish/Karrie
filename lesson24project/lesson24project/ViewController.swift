//
//  ViewController.swift
//  lesson24project
//
//  Created by Карина Дьячина on 15.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    var timezoneArray: Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "TODO"
        
        setupNavigation()
        setupTableView()
        
    }
    
    func setupNavigation() {
        let plusButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
                    tableView.topAnchor.constraint(equalTo: view.topAnchor),
                    tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                    tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
                    tableView.leftAnchor.constraint(equalTo: view.leftAnchor)
                ])
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: "EventTableViewCell")
    }
    
    func getTimeZone(){
        let knownTimeZoneIdentifiers = TimeZone.knownTimeZoneIdentifiers
        for timeZones in TimeZone.knownTimeZoneIdentifiers {
            let timeZone = TimeZone(identifier: timeZones)
            if let abbreviation = timeZone?.abbreviation(), let seconds = timeZone?.secondsFromGMT() {
                print ("timeZone: \(timeZones) \nabbreviation: \(abbreviation)\nsecondsFromGMT: \(seconds)\n")
                timezoneArray.append(Timezone(name: timeZones, abbr: abbreviation))
            }
        }
        
    }
    
    @objc func addButtonTapped() {
        let newTimezone = Timezone(name: "Minsk", abbr: "GMT+3")
        timezoneArray.append(newTimezone)
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timezoneArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventTableViewCell", for: indexPath) as! EventTableViewCell
        cell.configure(timezone: timezoneArray[indexPath.row])
        return cell
    }
    
    
}
