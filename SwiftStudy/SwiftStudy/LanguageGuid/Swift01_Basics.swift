//
//  Basics.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 13/09/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//

import Foundation
// ------常量和变量-------------
// 声明一个常量
let maxinumNumberOfLoginAttempts = 10
// 声明变量
var currentLoginAttempt = 0
// 同时声明多个变量
var x = 0.0, y = 0.0, z = 0.0
// 声明指定类型的变量
var welcomeMessage: String = "value"

var red = 0.1, green = 0.2, blue: Double = 0.3

let 你好 = "你好世界"
let 🐶 = "dog"

// 改变变量的值
var friendWelcome = "Hello!"
func wellcom() -> Void {
    friendWelcome = "Bonjour!"
    print(friendWelcome)
    // 字符串插入值操作
    print("The current value of friendWelcome is \(friendWelcome)")
}

// ------注释----------
// 注释
/*注释*/
/*注释1
 /*注释2*/
 注释3*/

// ----------分号------------
// 分号（Semicolons）：Swift语言中没行代码后面不需要分号，只有一行代码有多条语句时才需要用分号分开
func semicolons() -> Void {
    let cat = "dog"; print(cat)
}

// --------整数（Integers）--------
let minValue = UInt8.min // 0
let maxValue = UInt8.max // 255

// --------类型安全和推断------------
// Swift是一种类型安全的语言，在程序编译的时候回对类型检查。如果没有指定类型，Swift会对值的类型进行推断
let meaningOfLife = 42 // 推断为42
let pi = 3.14159  // Swift推断为Double而不是Float
let anotherPi = 3 + 0.14159 // 推断为Double

// --------数字类型的字面值-------
// 0b：二进制，0o：八进制，0x：十六进制
let decimalInteger = 17     // 十进制
let binaryInteger = 0b10001 // 二进制
let octalInteger = 0o21     // 八进制
let hexadecimalInteger = 0x11 // 十六进制

// 1.25e2 == 1.25 * 10(2); 1.25e-2 == 1.25 * 10(-2): 10的负2次幂
// 1.25p2 == 1.25 * 2(2)； 1.25p-2 == 1.25 * 2(-2):   2的负2次幂

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMilli0n = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

// -------数值类型转换--------
// Unit8不能存储负数，所以下面是错的
//let cannotBeNegative: UInt8 = -1
// Int8不能存储超过最大值的数，所以下面是错的
//let tooBig: Int8 = Int8.max + 1
// 不同类型的数不能直接相加，必须转换类型,例如下面：
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

// 整型和浮点型
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine


// 强制转换
let pi3 = Int(pi2)

// --------类型别名-------------
// 你声明一个别名之后，你可以在任何地方使用最初的名字
typealias AudioSmaple = UInt16
var maxAmplitudeFound = AudioSmaple.min

// --------Booleans值--------
let orangeAreOrange = true
let turnipsAreDelicious = false

func booleans() -> Void {
    if turnipsAreDelicious {
        print("Mmm, tasty turnips!")
    } else {
        print("Eww, turnips are horrible.")
    }
}


// ---------元组----------------
let http404Error = (404, "Not Found")
// 下面statusCode是404，statusMessage是Not Found
let (statusCode, statusMessage) = http404Error
// 获取一个值,justTheStatusCode是404
let (justTheStatusCode, _) = http404Error
// 获取第一个值和第二个值
let httpOne = http404Error.0
let httpTwo = http404Error.1

// 分别命名元组的每个元素
let http200Status = (statusCode: 200, description: "OK")

// -----------可选参数---------
// 下面值中是数字，因此可以转换为Int类型，如果有字母或者Bool值则转换失败
let  possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

// -------------nil-------------
var serverResponseCode: Int? = 404
func nilFunc() -> Void{
    serverResponseCode = nil
}
// 如果声明一个变量，没有赋值，则默认是nil
var surveyAnswer: String?
func survey() -> Void {
    if convertedNumber != nil {
        print("convertedNumber contains some integer value.")
    }
    // 如果可选值Int(possibleNumber)是nil，则条件为false，直接跳过执行else，如果不是，则将该值赋值给actualNumber并且执行if条件中的代码
    if let actualNumber = Int(possibleNumber) {
        print("\"\(possibleNumber)\" has an integer value of \(actualNumber)")
    } else {
        print("\"\(possibleNumber)\" could not be converted to an integer")
    }
    // 多个可选值
    if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
        print("\(firstNumber) < \(secondNumber) < 100")
    }
    // 隐式解析可选类型
    
    let possibleString: String? = "An optional string."
    let forcedString: String = possibleString!
    let assumedString: String! = "An implicitly unwrapped optional string."
    let implicitString: String  = assumedString
    
    if assumedString != nil {
        print(assumedString)
    }
    
    if let definiteString = assumedString {
        print(definiteString)
    }
}

// ---------Error Handling---------------
func canThrowAnError() throws {
    
}

func error() -> Void {
    do {
        try canThrowAnError()
    } catch {
        
    }
}

func makeASandwitch() throws {
    
}

func sandWitch() -> Void {
    do {
        try makeASandwitch()
    } catch {
        
    }
}

// -------------用断言调试------------
let age = -3
func assertFunc() -> Void {
    assert(age >= 0, "A person's age can't be less than zero.")
    assert(age >= 0)
}

// 如果已经检查了条件，你可以用assertionFailurele(_:file:line)来指示断言失败
func func8() -> Void {
    if age > 10 {
        print("You can ride the roller-coaster or the ferris wheel.")
    } else if age > 0 {
        print("You can ride the ferris wheel.")
    } else {
        assertionFailure("A person's age can't be less than zero.")
    }
}

// --------强制先决条件-------------
func func9() -> Void {
    let index = 10
    precondition(index > 0, "Index must be greater than zero.")
}
















