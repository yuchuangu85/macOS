//
//  Swift004_EunmsAndStructures.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 20/07/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
// Enumerations（枚举） And Structures（结构体）

import Foundation

class Enumerations {
    init() {
        let ace = Rank.ace
        let rawValue = ace.rawValue
        print(rawValue)
    }
    
    // 使用enum来创建一个枚举。就像类和其他所有命名类型一样，枚举可以包含方法。
    // 默认情况下，swift语音将0分配给第一个raw value，依次加1，你也可以指定固定值来改变
    // 下面例子中ace对应的raw value是1，其他值依次对应，你也可以用字符串（String）或者浮点型
    // 数字代替整数，在用枚举的时候如果找不到对应值就会返回nil，
    enum Rank: Int {
        case ace = 1
        case two, three, four, five, six, seven, eight, nine, ten
        case jack, queen, king
        func simpleDescription() -> String {
            switch self {
            case .ace:
                return "ace"
            case .jack:
                return "jack"
            case .queen:
                return "queen"
            case .king:
                return "king"
            default:
                return String(self.rawValue)
            }
        }
    }
    
    func func1() -> Void {
        if let convertedRank = Rank(rawValue: 3) {
            let threeDescription = convertedRank.simpleDescription()
            print(threeDescription)
        }
        
    }
    
    // 枚举的成员值是实际值，并不是原始值的另一种表达方式。实际上，如果没有比较有意义的原始值，你就不需要提供原始值
    enum Suit {
        case spades, hearts, diamonds, club
        func simpleDescription() -> String {
            switch self {
            case .spades:
                return "spades"
            case .hearts:
                return "hearts"
            case .diamonds:
                return "diamonds"
            case .club:
                return "club"
            }
        }
    }
    // 注意：有两种方式可以引用hearts成员：给hears常量赋值时，枚举成员Suit.hearts需要用全名来引用，因为常量没有显式指定类型。在switch里，枚举成员使用缩写.hearts来引用，因为self的值已经知道是一个suit。已知变量类型的情况下你可以使用缩写。
    
    
    func func2() -> Void {
        let hearts = Suit.hearts
        let herartDescription = hearts.simpleDescription()
        print(herartDescription)
    }
    
    // 一个枚举成员实例可以有实际值。相同枚举成员的实例可以有不同的值。创建实例的时候传入值即可。实例值和原始值是不同的：枚举成员的原始值对于所有实例都是相同的，而且你是在定义枚举的时候设置原始值。
    enum ServerResponse {
        case result(String, String)
        case failure(String)
    }
    
    func func3() -> Void {
        let success = ServerResponse.result("6:00 am", "8:09 pm")
        let failure = ServerResponse.failure("Out of cheese")
        switch success {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure... \(message)")
        }
        
        switch failure {
        case let .result(sunrise, sunset):
            print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
        case let .failure(message):
            print("Failure... \(message)")
        }
    }
}

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}

enum Suit {
    case spades, hearts, diamonds, club
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .club:
            return "club"
        }
    }
}

// Struct 是值引用，class是类引用，二者的区别是：在swift中，类型引用和值引用的区别在于，
// 对于类型引用(class reference)，将变量a赋值给变量b，即b = a，这样的赋值语句仅仅将b的指针
// 与a的指针一样，指向同一块内存区域，此时改变b的值，a也会跟着改变；
// 而对于值引用(value reference)，赋值语句b = a处理的过程是开辟一个新的内存b，将a变量的
// 内容拷贝后存放到内存b，这时a和b完全没有关系的两个变量，对b的改变不会影响到a，反之亦然。
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

class Struction {
    init() {
        let threeOfSpades = Card(rank: .three, suit: .spades)
        let threeOfSpadesDescription = threeOfSpades.simpleDescription()
        print(threeOfSpadesDescription)
    }
}





