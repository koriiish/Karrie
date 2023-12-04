//
//  ViewController.swift
//  HW2Karrie
//
//  Created by Карина Дьячина on 30.11.23.
//

import UIKit

class ViewController: UIViewController {
    
    var counter = 0
    let letter = ["авб", "ввш"]
    var a: String = "uuu"
    
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
        
        // через замыкание сравнивает и печатает в последовательности от большего к меньшему
        let lettersClosure = letter.sorted(by: { (s1: String, s2: String) -> Bool in
           return s1 > s2
        })
        print (lettersClosure)
        
     
        //4. Циклический вызов функций - поломать приложение
        
        // закомментила, чтобы остальное проверять)
/*      func breakAnApp () {
            var summa = 2
            while summa > 1{
                summa += 1
                print(summa)
            }
        }
        breakAnApp()
 */
        // тоже самое только через repeat - while
 /*       func breakTheApp() {
            var count = 1
            repeat {
                count += 1
                print (count)
            } while count > 0
        }
        breakTheApp()
  */
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
        // обычная функция
       /* func counterPlusOne() {
                counter += 1
                print(counter)
            }
        counterPlusOne()
        counterPlusOne()
        counterPlusOne()
        */
        
        // self предложил добавить Xcode (по идее мы явно ссылаемся?)
        let counterPlusOneClosure = { [self](amount: Int) in
            self.counter += amount
            print (counter)
        }
        counterPlusOneClosure(1)
        counterPlusOneClosure(1)
        
        //***Замыкание в котором ты проверяешь полил ли ты цветок, если нет то напоминание полить цветок
        
        let toWaterFlowersClosure = { [self](water: String) in
            if water == a {
                return ("Attaboy")
            } else {
                return ("You should water flower")
            }
        }
       print (toWaterFlowersClosure("pour"))
        
        //*** Выполнить любое замыкание внутри замыкания по очереди/ замыкание внутри любой функции
        func action() -> (()->Int){
            var val = 0
            return {
                val = val+1
                return val
            }
        }
        let inc = action()
        print(inc())
        print(inc())
        
        }
    
    }
        
    

