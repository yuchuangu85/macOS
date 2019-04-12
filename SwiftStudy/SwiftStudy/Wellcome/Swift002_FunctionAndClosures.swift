//
//  Swift002_FunctionAndClosures.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 14/07/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
// Function（函数）And Closures（闭包）

import Foundation

class FunctionAndClosure {
    
    init() {
        print(func1())
        print(func2())
        func3()
        func4()
        func5()
        func6()
        func7()
        func8()
        
    }
    
    // 用func声明一个函数，可以在后面圆括号中添加一系列参数，用->将参数和返回类型分开
    func greet(person: String, day: String) -> String {
        return "Hello \(person), today is \(day)."
    }
    
    func func1() -> String {
        return greet(person: "Boy", day: "Tuesday")
    }
    
    // 默认情况，函数中的参数名（person，day）都是参数的一个标签，在定义函数时你可以像上面函数一样
    // 写个普通标签，也可以替换成“_”，表示调用函数时不需要标签
    func greet1(_ person: String,on day: String) -> String {
        return "Hello \(person), today is \(day)"
    }
    
    func func2() -> String {
       return greet1("Bob", on: "Wednesdy" )
    }
    
    // 通过元组返回一个复合值，例如一个函数返回多个值。元组的元素既可以用名字或者数字来表示
    func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int){
        var min = scores[0]
        var max = scores[1]
        var sum = scores[2]
        for score in scores{
            if score > max {
                max = score
            }else if score < min {
                min = score
            }
            sum += score
        }
        return (min, max, sum)
    }
    
    func func3() -> Void {
        let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
        print(statistics.sum)
        print(statistics.2)
    }
    
    // 函数参数可以设置成一个可变个数的参数，这些参数在函数中表现为数组的形式
    func sumOf(numbers: Int...) -> Int {
        var sum = 0
        for number in numbers{
            sum += number
        }
        return sum
    }
    
    func func4() -> Void {
        print(sumOf())
        print(sumOf(numbers: 42, 597, 12))
    }
    
    // 嵌套函数，内部函数中的变量需要再外部函数中声明
    func returnFifteen() -> Int {
        var y = 10
        func add(){
            y += 5
        }
        add()
        return y
    }
    
    func func5() -> Int {
        print(returnFifteen())
        return returnFifteen()
    }
    
    // 函数是一等类型，也就是说一个函数可以返回另一个函数做为它的值
    // (Int)代表返回值是一个函数, 返回函数有一个参数是Int, 返回的函数的返回值是Int型
    func makeIncrementer() -> ((Int) -> Int){
        func addOne(number: Int) -> Int {
            return 1 + number
        }
        // 返回函数addOne
        return addOne
    }
    
    func func6() {
        let increment = makeIncrementer()
        print(increment)
        print(increment(7))
    }
    
    // 函数还可以把另外一个函数做为它的参数
    // 第一个参数list是一个数组
    // 第二个参数condition后面的表示：传入一个函数，函数参数是Int类型，返回时Bool类型
    func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
        for item in list {
            if condition(item) {
                return true
            }
        }
        return false
    }
    
    func lessThanTen(number: Int) -> Bool {
        return number < 10
    }
    
    func func7() {
        let numbers = [20, 19, 7, 12]
        print(hasAnyMatches(list: numbers, condition: lessThanTen))
    }
    
    func func8() {
        let numbers = [20, 19, 7, 12]
        // 实际上，函数是一种特殊的闭包，代码块可以在以后被调用。闭包中的代码可以访问创建闭包范围内的变量
        // 和函数，即使在执行时闭包在不同范围内，在函数嵌套例子中也已经看到了。你可以在大括号（{}）内编写
        // 一个没用名称的闭包，用in分离参数和返回类型。
        // numbers.map应该是一个内部的匿名函数的结构, 使用这个方法, 会把numbers里的每个元素传入这个
        // 匿名函数中去, 这个做法很像Objective里面的迭代器, enum方法, numbers有几个元素, 这个匿名
        // 函数就会执行几次, 每次处理单个numbers里的元素
        numbers.map({ (number:Int) -> Int in
            let result = 3 * number
            return result
        })
        
        // 创建闭包还有许多更简洁的方法。如果一个闭包的返回类型已经知道，比如作为一个返回函数，你可以忽略
        // 参数类型，返回值类型，或者都忽略。单条语句可以直接将语句当做返回值。
        let mappedNumber = numbers.map({number in 3 * number})
        print(mappedNumber)
        
        // 你还可以把参数用数字替代名字，在很短的闭包中，这种方法尤其管用，
        // 作为函数最后一个传递参数的闭包可以直接跟在括号之后。
        // 当闭包是函数唯一的参数时，你可以省略小括号
        let sortedNumbers = numbers.sorted{ $0 < $1 }
        print(sortedNumbers)
    }

}






