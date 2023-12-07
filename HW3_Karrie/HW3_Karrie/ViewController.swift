//
//  ViewController.swift
//  HW3_Karrie
//
//  Created by Карина Дьячина on 3.12.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       // 1.Написать функцию, которая принимает опциональное число и, если оно есть, умножает его на 2
        
        func takeOptional (optionalNumber: Int?) {
                    if let optionalValue = optionalNumber {
                        print(optionalValue * 2)
                    } else {
                        print("Опционал не содержит значения")
                    }
                }
        takeOptional(optionalNumber: 10)
        takeOptional(optionalNumber: nil)
        
       //2.Использовать force unwrap для извлечения значения из опциональной переменной. Затем добавьте условие, чтобы обработать случай, если значение равно nil.
        
        var a = 4
        var b: Int? = nil
        var sum: Int = 0
        if b != nil {
             sum = a + b!
            print (sum)
        } else{
            print ("Переменной нет")
        }
        
       //3.Написать функцию, использующую оператор guard для проверки опционального значения. Если значение равно nil, выведите сообщение об ошибке, в противном случае выполните операцию с извлеченным значением. 3-4 примера
        // Пример1:
        func greetUser (isAuthenticated: Bool) {
            guard isAuthenticated else{
                print("Error: user is not authenticated")
                return
            }
            print("Hello user!")
        }
        
        greetUser(isAuthenticated: false)
        greetUser(isAuthenticated: true)
        
        //Пример2:
        var numbers = [3, 1, 0, 6]
        for number in numbers {
            guard number != 0 else{
                print("Can not divide by zero!")
                continue
            }
            print("6 / \(number) = \(6/number)")
        }
        
        //Пример3:
        func addOptionals (shouldPrintSum: Bool) {
            let d: Int? = 1
            let e: Int? = 2
            let f: Int? = 3
            guard let unwrappedD = d, let unwrappedE = e, let unwrappedF = f,
                  shouldPrintSum else{
                print("Error")
                return
            }
            print("Сумма равна = ", unwrappedD + unwrappedE + unwrappedF)
        }
        addOptionals(shouldPrintSum: false)
        addOptionals(shouldPrintSum: true)
        
       //4.Напишите функцию, которая принимает строку и пытается преобразовать ее в целое число. Если преобразование возможно, верните число, если нет - nil
        
        func stringToInt (string: String?){
            guard string != nil else{
                print("Value is nil")
                return
            }
            let stringToInt = Int(string.self!)
            print(stringToInt)
        }
        
        stringToInt(string: "10")
        stringToInt(string: nil)
        
//        func stringToInt (string: String?){
//            if let stringToInt = Int(string.self!) {
//                print(stringToInt)
//            } else {
//                print("Value is nil")
//            }
//        }
//        stringToInt(string: "10")
//        stringToInt(string: nil)
//        
       // 5.Создать перечисление Book. Напишите функцию, которая принимает Book и выводит описание книги
        let bookDescription = Book.Fahrenheit451
        print (bookDescription.description())
        
       //6.Создайте перечисление Clothes. Напишите функцию, которая принимает Clothes в качестве параметра и выводит сообщение о выбранной одежде.
        //как с примера с телефоном
                
        let topClothes = Clothes.top.jacket
        let bottomClothes = Clothes.bottom.skirt
        let wearTopClothes = Clothes.topClothe(clotheType: topClothes)
        let wearBottomClothes = Clothes.bottomClothe(clotheType: bottomClothes)
        print (wearTopClothes.getClothesType(), "and", wearBottomClothes.getClothesType())
           
    }
}

