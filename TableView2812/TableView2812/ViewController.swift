//
//  ViewController.swift
//  TableView2812
//
//  Created by Карина Дьячина on 28.12.23.
//

import UIKit

class ViewController: UIViewController {
    var testArray: [Test] = []
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let test1 = Test(image: "", label: "test1")
        let test2 = Test(image: "", label: "test2")
        let test3 = Test(image: "", label: "test3")
        testArray.append(test1)
        testArray.append(test2)
        testArray.append(test3)
        
        addTableView()
        setupConstraints()
        setupTableView()
        
        
    }
    
    func addTableView() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupTableView() {
        tableView.register(CellOne.self, forCellReuseIdentifier: "CellOne")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return testArray.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellOne", for: indexPath) as! CellOne
            let test = testArray[indexPath.row]
            cell.configure(test: test)
            return cell
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
        
    }

