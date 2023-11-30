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
        }
        
    }


