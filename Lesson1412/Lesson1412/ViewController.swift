//
//  ViewController.swift
//  Lesson1412
//
//  Created by Карина Дьячина on 14.12.23.
//

import UIKit

class ViewController: UIViewController {
    let frameRect = CGRect(x: 20, y: 20, width: 200, height: 150)//можно поменять расположение
        let customView = UIView()
        let label = UILabel()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
//        addViews()
//        customViewSetup()
//        removeFromSuperview()
//        viewsInfo()
       // addNavigationController()
    }
        
        func addViews() {
            self.view.addSubview(customView)
        }
    func customViewSetup() {
        customView.backgroundColor = UIColor.blue
        //        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.frame = frameRect
        //        NSLayoutConstraint.activate([
        //            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        //            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        //            customView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
        //            customView.heightAnchor.constraint(equalToConstant: 100)
        //        ])
    }
    func viewsInfo() {
            
    //        customView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
    //        customView.bounds = CGRect(x: 0, y: 0, width: 300, height: 200)
    //        customView.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
            
            customView.alpha = 0.5
        
            customView.layer.cornerRadius = 10.0
            customView.layer.shadowColor = UIColor.black.cgColor
            customView.layer.shadowOpacity = 0.5
        }
    
            func removeFromSuperview() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    self.customView.removeFromSuperview()
                }
            }
    func addNavigationController() {
            let secondViewController = SecondViewController()
            let navigationController = UINavigationController(rootViewController: secondViewController)
            UIApplication.shared.windows.first?.rootViewController = navigationController
        }
    class SecondViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            configure()
        }
        
        func configure() {
            let nextButton = UIButton(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
            nextButton.setTitle("Go to Third", for: .normal)
            nextButton.addTarget(self, action: #selector(goToThirdViewController), for: .touchUpInside)
            view.addSubview(nextButton)
            view.backgroundColor = UIColor.green
        }
        
        @objc func goToThirdViewController() {
            let thirdViewController = ThirdViewController()
            navigationController?.pushViewController(thirdViewController, animated: true)
        }
    }
    class ThirdViewController: UIViewController {
        override func viewDidLoad() {
            super.viewDidLoad()
            
            configure()
        }
        class FavoriteViewController: UIViewController {
            
            override func viewDidLoad() {
                super.viewDidLoad()
                view.backgroundColor = .darkGray
                title = "Favorite"
                tabBarItem = UITabBarItem(title: "Favorite", image: nil, tag: 0)
            }
        }
        
        
        func configure() {
            let backButton = UIButton(frame: CGRect(x: 50, y: 100, width: 200, height: 50))
            backButton.setTitle("Go Back", for: .normal)
            backButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
            view.addSubview(backButton)
            view.backgroundColor = UIColor.red
        }
        
        
        @objc func goBack() {
            navigationController?.popViewController(animated: true)
        }
    }
        }
    


