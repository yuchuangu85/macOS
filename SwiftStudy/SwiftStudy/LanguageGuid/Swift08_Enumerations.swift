//
//  Swift08_Enumerations.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// 枚举

// 枚举语法
enum CompassPoint {
    case north
    case south
    case east
    case west
}

// 多成员出现在同一行，用都好隔开
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 枚举名字用单数名字
var directionToHead = CompassPoint.east

// directionToHead 的类型可以在它被 CompassPoint 的某个值初始化时推断出来。一旦 directionToHead
// 被声明为 CompassPoint 类型，你可以使用更简短的点语法将其设置为另一个 CompassPoint 的值：
func swiftFunc1() {
    directionToHead = .north
}

// 使用Switch语句匹配枚举值
func swiftFunc2() {
    directionToHead = .south
    switch directionToHead {
    case .north:
        print("Lots of planet have a north")
    case .south:
        print("Watch out for penguins")
    case .east:
        print("Where the sun rises")
    case .west:
        print("Where the skies are blue")
    }
    
    // 正如在控制流中介绍的那样，在判断一个枚举类型的值时，switch 语句必须穷举所有情况。
    // 如果忽略了 .west 这种情况，上面那段代码将无法通过编译，因为它没有考虑到 CompassPoint
    // 的全部成员。强制穷举确保了枚举成员不会被意外遗漏。
    
    // 当不需要匹配每个枚举成员的时候，你可以提供一个 default 分支来涵盖所有未明确处理的枚举成员：
    
    let somePlanet = Planet.earth
    switch somePlanet {
    case .earth:
        print("Mostly harmles")
    default:
        print("Not a safe place for humans")
    }
    
}

// 关联值
// 在 Swift 中，使用如下方式定义表示两种商品条形码的枚举：
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
// 上面代码理解：定义一个名为Barcode的枚举类型，它的一个成员值是具有(Int, Int, Int, Int)类型的关联值upc，
// 另一个成员值是具有String类型关联值的qrCode。在上面定义的时候是不存储关联值的，只是声明了关联值的类型，只有
// 声明的变量或者常量等于Barcode.upc或者Barcode.qrCode时才存储值
var productBarcode = Barcode.upc(8, 85909, 5122, 3)// 关联的元组值为(8, 85909, 5122, 3)
func swiftFunc3() {
    productBarcode = .qrCode("ABCSDDLKLLL")// 新的关联值替换旧的关联值
    
    switch productBarcode {
    case .upc(let numberSystem, let manufacturer, let product, let check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case .qrCode(let productCode):
        print("QR code: \(productBarcode)")
    }
    
    // 如果一个枚举成员的所有关联值都被提取为常量，或者都被提取为变量，为了简洁，你可以只在成员名称前标注一个 let 或者 var：
    switch productBarcode {
    case let .upc(numberSystem, manufacturer, product, check):
        print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
    case let .qrCode(productCode):
        print("QR code: \(productBarcode)")
    }
}

// 原始值
// 使用 ASCII 码作为原始值的枚举：
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
// 原始值可以是字符串、字符，或者任意整型值或浮点型值。每个原始值在枚举声明中必须是唯一的。

// 原始值的隐式赋值
// 当使用整数作为原始值时，隐式赋值的值依次递增 1。如果第一个枚举成员没有设置原始值，其原始值将为 0。
enum PlanetInt: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}

// 当使用字符串作为枚举类型的原始值时，每个枚举成员的隐式原始值为该枚举成员的名称。
enum CompassPointString: String {
    case north, south, east, west
}

let earthOrder = PlanetInt.earth.rawValue // 3
let sunsetDirection = CompassPointString.west.rawValue // west

// 使用原始值初始化枚举实例
let possiblePlanet = PlanetInt(rawValue: 7)
// possiblePlanet 类型为 Planet? 值为 Planet.uranus
// 然而，并非所有 Int 值都可以找到一个匹配的行星。因此，原始值构造器总是返回一个可选的枚举成员。
// 在上面的例子中，possiblePlanet 是 Planet? 类型，或者说“可选的 Planet”。如果不存在返回nil

func swiftFunc4() {
    let positionToFind = 11
    if let somePlanet = PlanetInt(rawValue: positionToFind) {
        switch somePlanet {
        case .earth:
            print("Mostly harmless")
        default:
            print("Not a safe place for humans")
        }
    } else {
        print("There isn't a planet at position \(positionToFind)")
    }
    // 这里就是找不到
}

// 递归枚举
// 递归枚举是一种枚举类型，它有一个或多个枚举成员使用该枚举类型的实例作为关联值。使用递归枚举时，
// 编译器会插入一个间接层。你可以在枚举成员前加上 indirect 来表示该成员可递归。
enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
// 或者
indirect enum ArithmeticExpression1 {
    case number(Int)
    case addition(ArithmeticExpression1, ArithmeticExpression1)
    case multiplication(ArithmeticExpression1, ArithmeticExpression1)
}

// 上面定义的枚举类型可以存储三种算数表达式：纯数字，两个表达式相加，两个表达式相乘。枚举成员addition和multiplication
// 的关联值也是一个算数表达式--这些关联值使得嵌套表达式成为可能。

// 通过枚举创建表达式(5 + 4) * 2
let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

func swiftFunc5() {
    print(evaluate(product))
}




















