//
//  ViewController.swift
//  Lesson 0512
//
//  Created by Карина Дьячина on 5.12.23.
//

import UIKit

class ViewController: UIViewController {
    
    var intArray: Array<Int> = []
    var numbers = [1, 2, 3, 4, 5]
    var emptyArray = [Int]()
    var fruits = ["Apple", "Banana", "Orange", "Strawberry"]
    var todoList = ["Walk", "Run", "Sleep", "Go to shop", "Clean house"]
    var userInfo: [String : Any] = ["Имя": "Анна", "Возраст": 25, "Email": "anna@example.com"]
    let dict: Dictionary<String, Any> = [:]
    let dict2: [String : Any] = [:]  // вместо any можно [Int]] будет так выглядеть
    // первый ключ - второе значение
    var emptyDictionary = [String: Int]()
    var scores = ["John": 85, "Alice": 90, "Bob": 75]
    var studentInfo = ["ID001": "John", "ID002": "Alice", "ID003": "Bob"]
    var appSettings = ["sound": true, "notifications": false, "darkMode": true]
    var emptySet = Set<Int>()
    var setNumbers: Set<Int> = [1, 2, 3, 4, 5]
    let otherSet: Set<Int> = [3, 4, 5, 6, 7]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        //МАССИВЫ
        //        print(numbers.count) // считает количество чисел в массиве
        //        numbers.append(8) // добавление числа 8 в конец массива
        //        print(numbers)
        //
        //        numbers.remove(at: 1) // удаление элемена из массива по индексу (те 2е по счету)
        //        print(numbers)
        //
        //        numbers.removeLast() // удаление последнего из массива
        //        print(numbers)
        //
        //        print(fruits[1]) //принтит банан (второй по индексу)
        //
        //        numbers[2] = 10 // изменяет третий (по индексу 2) на 10
        //
        //        todoList.append("Do homework")
        //        print(todoList)
        
        //        for number in numbers{
        //            print(number)
        //        }
        //        fruits.forEach { fruit in
        //            print(fruit)
        //        }
        //
        //        // Получение индекса элемента
        //        if let index = fruits.firstIndex(of: "Apple") {//ищет упоминание
        //            print("Индекс яблока: \(index)")
        //        }
        //
        ////      var numbers = [10, 20, 30, 40, 50]
        //
        //        for (index, value) in fruits.enumerated() { // в for можно задавать 2 элемента (и enumarated это для пары значений)
        //            print("Элемент \(value) находится на позиции \(index)")
        //            // value это банан условно, индекс - его позиция (могут быть любые слова)
        //        }
        //        // tuples кортежи
        //
        //        let person = ("John", 30)
        //
        //        let coordinates: (x: Int, y: Int) = (2, 5) //кортеж с указанием типов
        //        // можно сразу указать в скобках данные
        //        print(coordinates)
        //
        //        // dictionary словарь
        //
        //        // var scores = ["John": 85, "Alice": 90, "Bob": 75]
        //        scores["Emily"] = 95 //новая пара
        //        scores["Bob"] = 80 //обновление значения по существуюзему ключу
        //        print(scores) //не упорядочен
        //        print(scores["Alice"])
        //
        //        scores["John"] = nil // Удаление элемента по ключу
        //        // scores.removeValue(forKey: "John")
        //        for (name, score) in scores {
        //            print("\(name) получил \(score) баллов")
        //        }
        //
        //        // Проверка наличия значения по ключу
        //        if let bobScore = scores["Bob"] {
        //            print("Оценка Боба: \(bobScore)")
        //        } else {
        //            print("Оценка Боба не найдена")
        //        }
        //
        //        //пример со студентИнфо - это ключ номер студента, значение - имя
        //        studentInfo["ID656"] = "Ivan Ivanov"
        //        studentInfo["ID001"] = "John Doe"
        //        let age = userInfo["Возраст"] //Получение значение по ключу из кортежа
        //
        //        //appsettings - про уведомления
        //        appSettings["notifications"] = true
        //
        //        //корзина продуктов
        //        var products = [
        //            "ID001": ["name": "Product X", "price": 15.49], //как штрихкод
        //            "ID002": ["name": "Product Y", "price": 27.60]
        //        ]
        //
        //        products["ID003"] = ["name": "Product W", "price": 50.90] // добавление продукта
        //        print(products["ID001"])
        //        print(products)
        //
        //        //
        //
        //        var books = [
        //            "Book001": ["title": "Swift Programming", "author": "John Doe", "genre": "Programming"],
        //            "Book002": ["title": "The Alchemist", "author": "Paulo Coelho", "genre": "Fiction"]
        //        ]
        //
        //        let bookInfo = books["Book001"]
        //
        //        print(bookInfo)
        //
        //        //set множества
        //        setNumbers.insert(6) // Добавление элемента
        //
        //        setNumbers.remove(3) // Удаление элемента
        //
        //        if numbers.contains(4) {
        //            print("Число 4 содержится в множестве")
        //        }
        //
        //        for number in numbers {
        //            print(number)
        //                }
        //
        //        // var setNumbers: Set<Int> = [1, 2, 3, 4, 5]
        //        // let otherSet: Set<Int> = [3, 4, 5, 6, 7]
        //        let union = setNumbers.union(otherSet) // Объединение множеств
        //        let intersection = setNumbers.intersection(otherSet) // Пересечение множеств
        //        let difference = setNumbers.subtracting(otherSet) // Разность множеств
        //
        //        print(union)
        //        print(intersection)
        //        print(difference)
        //
        //
        //        if emptySet.isEmpty { //это как не равно nil
        //            print("Множество пустое")
        //        }
        //
        //        //массив можно превратить в сет
        //        let values = [1, 2, 3, 4, 5, 5, 5] //допустим если имя пользователя чтобы не повторялось
        //        let uniqueValues = Set(values)
        //        print(uniqueValues)
        //
        //        //использование со строками
        //        let text = "Swift is a powerful and and intuitive programming language."
        //        let words = Set(text.components(separatedBy: " "))
        //        print("Уникальных слов в тексте: \(words.count)") // только неповтряющихся
        //    }
        
        // функции высшего порядка
        //map
//        let stringNumbers = numbers.map { String($0) } //Преобразование чисел в строки
//        print(stringNumbers)
//        
//        let dictionary = ["a": 1, "b": 2, "c": 3]
//        let val = dictionary.map { $0.value }
//        
//        print(val)
//        
        let optionalNumbers: [Int?] = [1, nil, 3, nil, 5]
        let unwrappedNumbers = optionalNumbers.map { $0.map { $0 * 2 } }
        print(unwrappedNumbers)
//
//        // Filter
//        
//        let num = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
//        let evenNumbers = num.filter { $0 % 2 == 0 } // печатает четные
//        print(evenNumbers)
//        
//        let filterWords = ["apple", "banana", "orange", "kiwi", "grape"]
//        let longWords = filterWords.filter { $0.count > 5 } //печает слова больше 5 букв
//        print(longWords)
//        
//        let people = [
//            Person(name: "Alice", age: 25),
//            Person(name: "Bob", age: 14),
//            Person(name: "Charlie", age: 12)
//        ]
//                
//        let adults = people.filter { $0.age >= 18 }
//        print(adults)
//                
//        let filerNames = ["Alice", "Bob", "Charlie", "David"]
//        let filteredNames = filerNames.filter { $0.contains("li") }//содержит ли
//        print(filteredNames)
//        
        //Reduce
        //var numbers = [1, 2, 3, 4, 5]
        let sum = numbers.reduce(0, +) // сумма всех чисел
        // 0 - стартовое значение к которому плюсуем
        // всемто + можем проставить любую операцию
        // но надо коррекировать 0
        print(sum)
        
        let sum1 = numbers.reduce(0) { result, value in
            return result + value
        }
        print(sum1)
                
        let combineWord = ["Hello", " ", "Swift", "!"]
        let combinedString = combineWord.reduce("", +)
                
        print(combinedString)
                
        let wordsReduce = ["apple", "banana", "orange"]
        let combinedStringWithSeparator = wordsReduce.reduce("") { result, word in
            return result.isEmpty ? word : result + ", " + word
        }
                
        print(combinedStringWithSeparator)
        
        //forEach
        
        numbers.forEach { number in
            print(number)
        }
                
        fruits.forEach { fruit in
            print("I like \(fruit)")
        }
                
        numbers.forEach { number in
            if number < 30 {
                if let index = numbers.firstIndex(of: number) {
                    numbers.remove(at: index)
                }
            }
        }
                
        optionalNumbers.forEach { number in
            if let num = number {
                print("Value is \(num)")
            } else {
                print("Value is nil")
        }
    }
                
//            var total = 0
//            [10, 20, 30, 40, 50].forEach {
//            total += $0
//        }
        
        //Compact Map
        // если в массиве нет nil, то можно не исп
        let strings = ["1", "2", "3", "4", "5"]
        // let strings = ["1", "2", "three", "4", "five"]
        let compactString = strings.compactMap { Int($0) }
                
        let optionalStrings: [String?] = ["1", "2", nil, "4", "5"] // nil не вывел пропустил
        let validNumbers = optionalStrings.compactMap { Int($0 ?? "") }
                
        let dictionary5 = ["a": 1, "b": 2, "c": 3]
        let dictValue = dictionary5.compactMap { $0.value } // просто пример получения значений из диктионари
        print(dictValue)
        
        //sorted
        let unsortedNumbers = [1, 4, 2, 7, 3, 9, 8]
        let sortedNumbers = unsortedNumbers.sorted() // от меньшего к большему
                
        print(sortedNumbers)
                
        let unsortedWords = ["banana", "orange", "kiwi", "grape", "apple", "strawberry"]
        let alphabeticalOrder = unsortedWords.sorted() // по алфавиту
        print(alphabeticalOrder)
                
        let lengthSort = unsortedWords.sorted { $0.count < $1.count } // в этом случае доллар 1 - второе значение
        //меньше по количеству букв те должен вывсети от меньшего к большему
        
        let people = [
            Person(name: "Alice", age: 25),
            Person(name: "Bob", age: 14),
            Person(name: "Charlie", age: 12)
                ]
        let sortedByNameAndAge = people.sorted {
            if $0.name != $1.name { //имена не равны и встраивает их по алфавиту
                return $0.name < $1.name
            } else {
                return $0.age < $1.age
            }
        }
        print(sortedByNameAndAge)
        
        //ДЖЕНЕРИКИ
        
        func printArray<T>(_ array: [T]) { //T, U
            for element in array {
                print(element)
            }
        }
        printArray(unsortedNumbers)
        printArray(unsortedWords)
                
        func swapValues<T>(_ a: inout T, _ b: inout T) {//смена значений
            let temp = a
            a = b
            b = temp
            print("\(a) + \(b)")
        }
                
        var x = 5
        var y = 10
        swapValues(&x, &y)
        
        var str1 = "Hello"
        var str2 = "World"
        swapValues(&str1, &str2)
        
        func findMax<T: Comparable>(_ array: [T]) -> T? {
            guard var max = array.first else { return nil }
            for element in array {
                if element > max {
                max = element
                }
            }
                return max
        }
                
                
        let maxNumber = findMax([3, 7, 2, 9, 5])
        let maxString = findMax(["apple", "banana", "orange", "strawberry"])
        print(maxNumber) // макс число в массиве
        print(maxString) // более длинное слово
        
        func contains<T: Equatable>(_ value: T, in array: [T]) -> Bool {
            return array.contains(value)
        }
        
        let containsInt = contains(5, in: [1, 3, 5, 7, 9])
        let containsString = contains("apple", in: ["banana", "orange", "apple"])
                
        func convertToString<T>(_ array: [T]) -> [String] {
            return array.map { String(describing: $0) }
        }
                
        let stringArray = convertToString([1, 2, 3, "hello"])
                

    }
}
