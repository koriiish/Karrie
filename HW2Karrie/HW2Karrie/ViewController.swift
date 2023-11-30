//
//  ViewController.swift
//  HW2Karrie
//
//  Created by Карина Дьячина on 30.11.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //1. Универсальные функции сложения, вычитания, умножения и деления (перегрузка функций)
        
        func arifmetic (x: Int, y: Int) -> Int{
            return x+y
        }
        func arifmetic (_ x: Int, _ y: Int) -> Int{
            return x/y
        }
        func arifmetic (x:Int, y: Int, z: Int) -> Int{
            return x*y-z
        }
        
        print(arifmetic(x: 2, y: 4))
        print(arifmetic(10, 2))
        print(arifmetic(x: 10, y: 2, z: 12))
        
        //2. Вычислить сумму цифр четырехзначного числа
        let string = "1111"
        let sum = string.compactMap(\.wholeNumberValue).reduce(0, +)
        print(sum)
        
        let integer = 2222
        let sumInt = String(integer).compactMap(\.wholeNumberValue).reduce(0, +)
        print(sumInt)
        
        func fourNumber(_ a: Int) -> Int {
            return String(a).compactMap { Int(String($0)) }.reduce(0, +)
        }
        print(fourNumber(1234))
        
        //3. Функция сравнения строк - "авб" больше "ввш"
        
       /* struct : Comparable { ????????????/
        func code (first: String = "авб", second: String = "ввш"){
            first.utf8 < second.utf8 ? print("Вторая строка больше") : print ("Первая строка больше")
        }
       только с латиницей?
        let val1 = UnicodeScalar("a").value
        print("ASCII value of a is ", val1)

        let val2 = UnicodeScalar("o").value
        print("ASCII value of X is ", val2)
        
        выводит в столбец значение каждой буквы
        let str = "авб"
        for code in str.utf8 {
            print(code)
        }
        
        не дает сравнить
        var first: String = "авб"
        var second: String = "ввш"
        var firstA = first.utf8
        var secondA = second.utf8
        firstA < secondA ? print("Вторая строка больше") : print ("Первая строка больше")
        */
        
        //4. Циклический вызов функций - поломать приложение

        //5. Функция возведения в степень с дефолтным параметром
        func numberInPower (number: Decimal, power: Int){
            print(pow(number,power))
        }
        numberInPower(number: 2, power: 1)
        
        
       // ***Универсальные функции сложения, вычитания, умножения и деления через замыкание
        let substractClosure = {(x: Int, y: Int ) in
            print ("Вычитание данных чисел равно \(x-y)")
        }
        substractClosure(10, 8)

        //*** Замыкание внутри которой при вызове происходит увеличение счётчика на +1
        /*var numberPlusOne: Int = 0
        let numberPlusOneClosure = {(numberPlusOne: Int) in
            numberPlusOne += 1
         */
        
        
        //***Замыкание в котором ты проверяешь полил ли ты цветок, если нет то напоминание полить цветок
        
        
        //*** Выполнить любое замыкание внутри замыкания по очереди/ замыкание внутри любой функции

        

        
        }
    
    }
        
    

