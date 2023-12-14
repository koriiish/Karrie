//
//  ViewController.swift
//  Lesson1212
//
//  Created by Карина Дьячина on 12.12.23.
//

import UIKit


class ViewController: UIViewController {
    let label = UILabel()
    let button = UIButton(type: .system)
    func addSubviews() {
            self.view.addSubview(label)
            self.view.addSubview(button)
            
            self.view.addSubview(labelWithInit)
            self.view.addSubview(buttonWithInit)
            self.view.addSubview(imageView)
        }
        
        @objc func buttonTapped() {
            print("Кнопка была нажата")
    //        label.text = "Change text"
        }

     addSubviews()
//            setupLabel()
//            setupButton()

    let buttonWithInit: UIButton = {
            let button = UIButton(type: .system)
            button.setTitle("Press Button", for: .normal)
            button.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
//            button.translatesAutoresizingMaskIntoConstraints = false
            button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
            button.imageView?.image = UIImage(named: "")
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            return button
        }()
        
        let labelWithInit: UILabel = {
            let label = UILabel()
            label.text = "Hello World!"
            label.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
            return label
        }()
    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var mylabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
//        setupLabel()
//        setupButton()
//        mylabel.text = "Change Text"
//        mylabel.textColor = UIColor.blue
//        mylabel.font = UIFont.boldSystemFont(ofSize: 18.0)
//        mylabel.isHidden = false
//        mylabel.textAlignment = .left
//        mylabel.backgroundColor = UIColor.green
//        
//        myButton.isEnabled = false //не будет кликабельным
//        myButton.isHidden = false // есть у кажлого элемента
//        myButton.alpha = 0.5 //прозрачность
//       // myButton.setImage(UIImage(named: "photos"), for: .normal)
//        myButton.tintColor = UIColor.red
//        myButton.layer.borderWidth = 2.0
//        myButton.layer.borderColor = UIColor.blue.cgColor
//        myButton.backgroundColor = UIColor.clear
//        myButton.setTitle("Button pressed", for: .normal)
        
    }
    @IBAction func mybutton(_ sender: Any) {
    }
    @objc func myButtonSetup() {
            
        }
//    @objc func buttonTapped() {
//           // print("Кнопка была нажата")
//            label.text = "Change text"
//        }
    func addSubviews() {
            self.view.addSubview(label)
            self.view.addSubview(button)
            
//            self.view.addSubview(labelWithInit)
//            self.view.addSubview(buttonWithInit)
    //        self.view.addSubview(imageView)
    
        }
    func setupLabel() {
            label.text = "Hello World!"
           // label.frame = CGRect(x: 50, y: 200, width: 200, height: 50)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.textColor = UIColor.black
            label.textAlignment = .center
            label.font = UIFont.boldSystemFont(ofSize: 18.0)
        }
        
        func setupButton() {
            button.setTitle("Press Button", for: .normal)
           button.translatesAutoresizingMaskIntoConstraints = false
           // button.frame = CGRect(x: 50, y: 100, width: 200, height: 50)
            
            button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
            
        }
    func setupButtonsConstraints() {
            //MARK: - Constraint
            // Первый способ
            button.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 150).isActive = true
            button.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
            button.widthAnchor.constraint(equalToConstant: 200).isActive = true
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            // Второй способ
    //        NSLayoutConstraint.activate([
    //            button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
    //            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
    //            button.widthAnchor.constraint(equalToConstant: 200),
    //            button.heightAnchor.constraint(equalToConstant: 50)
    //        ])
            
            //        // Третий способ
    //        button.snp.makeConstraints { make in
    //            make.centerX.equalToSuperview()
    //            make.top.equalToSuperview().offset(100)
    //            make.width.equalTo(200)
    //            make.height.equalTo(50)
    //        }
        }

    func setupLabelsConstraints() {
            //MARK: - Constraint
            // Первый способ
        //топорный,
//            label.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
//            label.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 100).isActive = true
//            label.widthAnchor.constraint(equalToConstant: 200).isActive = true
//            label.heightAnchor.constraint(equalToConstant: 50).isActive = true
            
            // Второй способ
        //лучше, указываем активэйт и более корретно
        //для крутых проектов
//            NSLayoutConstraint.activate([
//                label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 20),
//                label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
            
            //        // Третий способ
        //ток если есть snapkit
//            label.snp.makeConstraints { make in
//                make.centerX.equalToSuperview()
//                make.top.equalTo(button.snp.bottom).offset(20)
//            }
        }
}

