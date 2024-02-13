//
//  ViewController.swift
//  lesson23-1
//
//  Created by Карина Дьячина on 13.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var array: [String] = ["Google", "Twitter", "Facebook", "YouTube"]
    var sites: [String] = ["https://www.google.by/", "https://twitter.com/?lang=ru", "https://www.facebook.com/?locale=ru_RU", "https://www.youtube.com"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        title = "WebSites"
        
    }
    
    func setupTableView() {
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LinkCellTableViewCell.self, forCellReuseIdentifier: "LinkCellTableViewCell")
        
        tableView.backgroundColor = .gray
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }

}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkCellTableViewCell", for: indexPath) as! LinkCellTableViewCell
        cell.configure(titleText: array[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        let storyboard = UIStoryboard(name: "FAQscreen", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "FAQscreen") as! FAQViewController
                vc.modalPresentationStyle = .fullScreen
        vc.urlSite = sites[indexPath.row]
       self.navigationController?.pushViewController(vc, animated: true)

        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
