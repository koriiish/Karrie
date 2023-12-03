//
//  Enums.swift
//  HW3_Karrie
//
//  Created by Карина Дьячина on 3.12.23.
//

import Foundation
// 5.Создать перечисление Book. Напишите функцию, которая принимает Book и выводит описание книги
enum Book: String{
    case OneThousandNineHundredEightyFour
    case Fahrenheit451
    case TheGreatGatsby
    case FlowersForAlgernon
    
    var description: String{
        switch self {
        case .OneThousandNineHundredEightyFour:
            return "A kind of antipode to the second great dystopia of the 20th century - Brave New World by Aldous Huxley. What, in essence, is more terrible: a consumer society taken to the point of absurdity, or a society of ideas taken to the absolute? According to Orwell, there is and cannot be anything more terrible than total unfreedom..."
        case .Fahrenheit451:
            return "A dystopian science fiction novel by Ray Bradbury, published in 1953. The novel describes a near-future American society in which books are banned; “firemen,” which includes the main character Guy Montag, burn any books they find"
        case .TheGreatGatsby:
            return "The Great Gatsby is told from the perspective of Fitzgerald, the probable writer Nick Carraway, who in the spring of 1922, in an era of decaying morality, brilliant jazz and the “kings of bootleg alcohol,” comes from the Midwest to New York.."
        case .FlowersForAlgernon:
            return "This is the story of 37-year-old janitor Charlie, who agrees to take part in an experiment to increase mental abilities. Suddenly, Charlie's IQ increases significantly, he learns to read and write and begins to express his thoughts more and more coherently and elegantly."
            
        }
    }
}
//6.Создайте перечисление Clothes. Напишите функцию, которая принимает Clothes в качестве параметра и выводит сообщение о выбранной одежде.
enum Clothes: String{
    case tshirt
    case pants
    case jacket
    case skirt
}
