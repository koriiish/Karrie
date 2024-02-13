//
//  ViewController.swift
//  Practice
//
//  Created by azinavi on 13/2/24.
//

//MARK: Замечания:
/* 1 if indexPath.row == 4 {
vc.htmlName = sites[indexPath.row]
self.navigationController?.pushViewController(vc, animated: true)
} else {
vc.urlSite = sites[indexPath.row]
self.navigationController?.pushViewController(vc, animated: true)
}
*/

import UIKit

class ViewController: UIViewController {
    var tableView = UITableView()
    var array: [String] = ["Google", "Facebook", "Twitter", "Youtube", "Some site"]
    var sites: [String] = ["https://www.google.co.jp/", "https://www.facebook.com/?locale=ru_RU", "https://twitter.com/?lang=ru", "https://www.youtube.com/watch?v=IBcwhaYP6Uk&t=210s", "Amazon"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        title = "WEBSITES"
        
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(LinkCellTableViewCell.self, forCellReuseIdentifier: "LinkCellTableViewCell")
        tableView.reloadData()
        tableView.backgroundColor = .black
        
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath)")
        let storyboard = UIStoryboard(name: "FAQScreen", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "FAQScreen") as! FAQViewController
        
        vc.modalPresentationStyle = .fullScreen
        
        if indexPath.row == 4 {
            vc.htmlName = sites[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            vc.urlSite = sites[indexPath.row]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
}
