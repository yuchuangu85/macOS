//
//  Swift06_Functions.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// 函数的定义与调用

func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}

func greetAgain(person: String) -> String {
    return "Hello again, " + person + "!"
}

// 函数的参数和返回值
// 无参函数
func sayHelloWorld() -> String {
    return "Hello, world"
}

// 多参数函数
func greet2(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}

// 无返回值函数
func greet3(person: String) {
    print("Hello, \(person)!")
}

// 多重返回值函数
func minMax(array: [Int]) -> (min: Int,  max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// 可选元组返回类型
// 如果函数返回的元组类型有可能整个元组都“没有值”，你可以使用可选的元组返回类型反应整个元组可以是nil的事实。
// 你可以通过在元组类型的右括号后放置一个问号来定义一个可选元组
func minMax1(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}

// 指定参数标签
func someFunction(argumentLabel parameterName: Int) {
    // 在函数体内，parameterName代表参数值，也就是具体值
    // argumentLabel为参数标签，能够让函数具有表达力，并且保持可读性
    print("\(parameterName)")
}

// 忽略参数标签
// 如果不希望为某一个参数添加一个标签，可以使用下划线（_）来代替明确的参数标签
func someFunc(_ firstParameterName: Int, secondParameterName: Int) {
    
}
// someFunc(1, secondParameterName: 2)
// 如果一个参数有参数标签，那么在调用的时候必须使用标签来编辑这个参数

// 默认参数值
func someFunction2(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // 如果在调用的时候不传入第二个参数，parameterWithDefault会默认传入12
}
// someFunction2(parameterWithoutDefault: 3, parameterWithDefault: 6)// 传入6
// someFunction2(parameterWithoutDefault: 4)// 默认传入12

// 可变参数
// 一个可变参数可接受零个或者多个值，函数调用时，你可以用可变参数来指定函数参数可以被传入的不确定数量的输入值
// 通过在变量类型后面输入（...）的方式定义可变参数
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
// arithmeticMean(1, 2, 3, 4, 5)
// arithmeticMean(3, 8, 11, 333)
// 一个函数最多只能有一个可变参数

// 输入输出参数
// 函数参数默认都是常量。如果你一个函数想要修改参数的值，并且想要在这些修改在函数调用结束后仍然存在，
// 那么就应该把这个参数定义为输入输出参数
// 定义一个输入输出参数时，在参数定义前加 inout 关键字。一个输入输出参数有传入函数的值，这个值被函数修改
// 然后被传出函数，替换原来的值。你只能传递变量给输入输出参数，不能传递常量或字面量，因为这些是不能修改的
// 当传入的参数作为输入输出参数时，需要再参数名前加 & 符号，表示这个值是可以被修改的
// 输入输出参数不能有默认值，而且可变参数不能用 inout 标记
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}

func swapTwoIntsF() {
    var someInt = 2
    var anotherInt = 107
    swapTwoInts(&someInt, &anotherInt)
}

// 函数类型
// 函数都有特定的类型，函数类型是由函数的参数类型和返回值类型组成的
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}

func multplyTwoInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}

func printHelloWorld() {
    print("Hello World!")
}

// 使用函数类型
var mathFunction: (Int, Int) -> Int = addTwoInts
// 解读：定义了一个叫做mathFunction的变量，类型是'一个有两个Int类型的参数并返回一个Int类型的值的函数'
//      并让这个变量指向addTwoInts函数
func mathF() {
    print("Result: \(mathFunction(2, 3))")
    mathFunction = multplyTwoInts
    print("Result: \(mathFunction(2, 3))")
    
    let anotherMathF = addTwoInts
    print("Result: \(anotherMathF(2, 3))")
}

// 函数类型作为参数类型
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b:Int) {
    print("Result: \(mathFunction(a, b))")
}

// 函数类型作为返回类型
func stepForward(_ input: Int) -> Int {
    return input + 1
}

func stepBackward(_ input: Int) -> Int {
    return input - 1
}

// 这个函数的返回类型是 (Int) -> Int 类型的函数
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}

func funcF() {
    var currentValue = 3
    let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
    
    while currentValue != 0 {
        currentValue = moveNearerToZero(currentValue)
    }
}

// 嵌套函数
// 上面的函数都叫全局函数，它们定义在全局域中，你可以把函数定义在别的函数体中，成为嵌套函数
// 默认情况下，嵌套函数对外界是不可见的，但是它们可以被外围的函数调用。一个外围函数也可以返回它的
// 某个嵌套函数，使得这个函数可以在其他域中被使用
func chooseStepFunction3(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int {
        return input + 1
    }
    
    func stepBackward(input: Int) -> Int {
        return input - 1
    }
    return backward ? stepForward : stepBackward
}

func choseFunc() {
    var currentValue = -4
    let moveNearerToZero = chooseStepFunction3(backward: currentValue > 0)
    while currentValue != 0 {
        currentValue = moveNearerToZero(currentValue)
    }
    print(currentValue)
}








