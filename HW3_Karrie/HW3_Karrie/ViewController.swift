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
        func takeOptional (optionalNumber: Int? = 10) {
            if let optionalValue = optionalNumber {
                print(optionalValue * 2)
            } else {
                print("Опционал не содержит значения")
            }
        }
        takeOptional()
       //2.Использовать force unwrap для извлечения значения из опциональной переменной. Затем добавьте условие, чтобы обработать случай, если значение равно nil.
       //3.Написать функцию, использующую оператор guard для проверки опционального значения. Если значение равно nil, выведите сообщение об ошибке, в противном случае выполните операцию с извлеченным значением. 3-4 примера
       //4.Напишите функцию, которая принимает строку и пытается преобразовать ее в целое число. Если преобразование возможно, верните число, если нет - nil
       // 5.Создать перечисление Book. Напишите функцию, которая принимает Book и выводит описание книги
        
        let bookDescription = Book.Fahrenheit451
        print (bookDescription.description())
        
       //6.Создайте перечисление Clothes. Напишите функцию, которая принимает Clothes в качестве параметра и выводит сообщение о выбранной одежде.
/*      func choosedClothes (x: Clothes, y: Clothes){
            print("I will wear \(x) and \(y)")
        }
       
        choosedClothes(x: .skirt, y: .jacket)
        */
        
        //как с примера с телефоном
        
        let topClothes = Clothes.top.jacket
        let bottomClothes = Clothes.bottom.skirt
        let wearTopClothes = Clothes.topClothe(clotheType: topClothes)
        let wearBottomClothes = Clothes.bottomClothe(clotheType: bottomClothes)
        print (wearTopClothes.getClothesType(), "and", wearBottomClothes.getClothesType())
    }
    


}

