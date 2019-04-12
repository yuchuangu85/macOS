//
//  Swift07_Closures.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// 闭包是自包含的函数代码块，可以在代码中被传递和使用。闭包可以捕获和存储其所在上下文任意常量和变量的引用，
// 被称为包裹常量和变量。
// 函数章节介绍的全局和嵌套函数实际上也是特殊的闭包，闭包采取如下三种形式之一：
// 1.全局函数是一个有名字但不会捕获任何值的闭包
// 2.嵌套函数是一个有名字并可以捕获其他封闭函数域内置的闭包
// 3.闭包表达式是一个利用轻量级语法所写的可以捕获其上下文中变量或者常量值的匿名闭包

// 闭包优点：
// 利用上下文推断参数和返回值类型
// 隐式返回但表达式闭包，即单表达式闭包可以省略return关键字
// 参数名称所写
// 尾随闭包语法

// 闭包表达式
// 排序方法
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}

var reversedNames = names.sorted(by: backward)
// 如果第一个字符串(s1)大于第二个字符串(s2)，backward返回true，表示在新的数组中s1应该出现在s2前面
// 对于字符串来说大于表示按照字母表书序较晚出现。

// 闭包表达式语法
// { (parameters) -> return type in
//     statements
// }

// 闭包表达式可以是in-out类型，但是不能设定默认值。如果你命名了可变参数，也可以用此可变参数。元组也可以作为参数和返回值
func reverseFunc() {
    reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in
        return s1 > s2
    })
    // 需要注意的是内联闭包参数和返回值类型声明与backward(_:_:)函数类型一样。在内联闭包表达式中，函数和返回值类型都写在大括号内，而不是大括号外
    // 闭包函数部分由关键字in引入。该关键字表示闭包的参数和返回值类型定义已经完成，闭包函数体即将开始
    // 上面的闭包函数体也可以写成一行，因为其比较短小
    reversedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2 })
    
    // 根据上下文推断类型
    reversedNames = names.sorted(by: {s1, s2 in return s1 > s2 })
    // 通过内联闭包表达式构造的闭包作为参数传递给函数或方法时，总是能够推断出闭包的参数和返回值类型。
    
    // 单表达式闭包隐式返回
    // 单表达式闭包可以通过省略return关键字来隐式返回单行表达式的结果
    reversedNames = names.sorted(by: {s1, s2 in s1 > s2})// 返回Bool值
    
    // 参数名称缩写
    // Swift自动为内联闭包提供了参数名称缩写功能，你可以直接通过$0, $1, $2来顺序调用闭包的参数，以此类推
    reversedNames = names.sorted(by: { $0 > $1 })
    
    // 运算符方法
    // Swift的String类型定义了关于大于号(>)的字符串实现，其作为一个函数接受两个String类型的参数并返回Bool类型的值
    // 这正好与sorted(by:)方法的参数需要的函数类型相符合。因此，你可以简单的传递一个多括号，Swift可以自动推断使用大于号的字符串实现
    reversedNames = names.sorted(by: >)
    
}


// 尾随闭包
// 如果你需要将一个很长的闭包表达式作为最后一个参数传递给函数，可以使用尾随闭包来增强函数的可读性。
// 尾随闭包是一个书写在函数括号之后的闭包表达式，函数支持将其作为最后一个参数调用
func someFunctionThatTakesAClosure(closure:() -> Void) {
    // 函数体
}

func funcF1() {
    // 下面是不使用尾随闭包进行函数调用
    someFunctionThatTakesAClosure(closure: {
        // 闭包主体部分
    })
    
    // 以下是使用尾随闭包进行函数调用
    someFunctionThatTakesAClosure() {
        // 闭包主体部分
    }
    
    reversedNames = names.sorted() { $0 > $1 }
    // 或
    reversedNames = names.sorted { $0 > $1 }
    
    // 当闭包非常长以至于不能在一行中进行书写时，尾随闭包变的非常有用。
    let digitNames = [
        0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four",
        5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"
    ]
    let numbers = [16, 58, 510]
    let strings = numbers.map {
        (number) -> String in
        var number = number
        var output = ""
        repeat {
            output = digitNames[number % 10]! + output
            number /= 20
        } while number > 0
        return output
    }
    // map(_:) 为数组中每一个元素调用了一次闭包表达式。你不需要指定闭包输入参数number类型，因为可以通过
    // 要映射的数组类型推断
    // 在该例中，局部变量 number 的值由闭包中的 number 参数获得，因此可以在闭包函数体内对其进行修改，
    // (闭包或者函数的参数总是常量)，闭包表达式指定了返回类型为 String，以表明存储映射值的新数组类型为 String。
    
    // 闭包表达式在每次被调用的时候创建了一个叫做 output 的字符串并返回。其使用求余运算符（number % 10）
    // 计算最后一位数字并利用 digitNames 字典获取所映射的字符串。这个闭包能够用于创建任意正整数的字符串表示。
    
    // 字典 digitNames 下标后跟着一个叹号（!），因为字典下标返回一个可选值（optional value），
    // 表明该键不存在时会查找失败。在上例中，由于可以确定 number % 10 总是 digitNames 字典的
    // 有效下标，因此叹号可以用于强制解包（force-unwrap）存储在下标的可选类型的返回值中的 String 类型的值。
    
    // 在上面的例子中，通过尾随闭包语法，优雅地在函数后封装了闭包的具体功能，而不再需要将整个闭包
    // 包裹在 map(_:) 方法的括号内。
 
    
}

// 值捕获
// 闭包可以在其被定义的上下文中捕获常量或变量。即使定义这些常量和变量的原作用域已经不存在，
// 闭包仍然可以在闭包函数体内引用和修改这些值。

// Swift 中，可以捕获值的闭包的最简单形式是嵌套函数，也就是定义在其他函数的函数体内的函数。
// 嵌套函数可以捕获其外部函数所有的参数以及定义的常量和变量。

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func increment() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return increment
}

let incrementByTen = makeIncrementer(forIncrement: 10)
func reverseFunc2() {
    incrementByTen()
    // 返回值为10
    incrementByTen()
    // 返回值为20
    
    let incrementBySeven = makeIncrementer(forIncrement: 7)
    incrementBySeven()
    // 返回值为7
    
    // 再次调用
    incrementByTen()
    // 返回值为30
    // 它会增加自己的runningTotal变量，该变量和incrementBySeven中捕获的变量没有任何联系
    
    // 闭包是引用类型
    // 上面的例子中，incrementBySeven 和 incrementByTen 都是常量，但是这些常量指向的闭包仍然
    // 可以增加其捕获的变量的值。这是因为函数和闭包都是引用类型。
    
    // 无论你将函数或闭包赋值给一个常量还是变量，你实际上都是将常量或变量的值设置为对应函数或闭包的引用。
    // 上面的例子中，指向闭包的引用 incrementByTen 是一个常量，而并非闭包内容本身。
    
    // 这也意味着如果你将闭包赋值给了两个不同的常量或变量，两个值都会指向同一个闭包：
    let alsoIncrementByTen = incrementByTen
    alsoIncrementByTen()
    // 返回值为40
    
}

// 逃逸闭包
// 当一个闭包作为参数传到一个函数中，但是这个闭包在函数返回之后才被执行，我们称该闭包从函数中逃逸。
// 当你定义接受闭包作为参数的函数时，你可以在参数名之前标注 @escaping，用来指明这个闭包是允许“逃逸”出这个函数的。
// 一种能使闭包“逃逸”出函数的方法是，将这个闭包保存在一个函数外部定义的变量中。
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: @escaping () -> Void) {
    completionHandlers.append(completionHandler)
}
// 上面方法中的参数是闭包参数，该闭包被添加到一个函数外定义的数组中

// 将一个闭包标记为 @escaping 意味着你必须在闭包中显式地引用 self。
func someFunctionWithNonescapingClosure(closure: () -> Void) {
    closure()
}

class SomeCls {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure {
            self.x = 100
        }
        someFunctionWithNonescapingClosure {
            x = 200
        }
    }
}

func doSomeThing() {
    let instance = SomeCls()
    instance.doSomething()
    print(instance.x)
    
    completionHandlers.first?()
    print(instance.x)
}

// 自动闭包
// 自动闭包是一种自动创建的闭包，用于包装传递给函数作为参数的表达式。这种闭包不接受任何参数，
// 当它被调用的时候，会返回被包装在其中的表达式的值。这种便利语法让你能够省略闭包的花括号，
// 用一个普通的表达式来代替显式的闭包。

// 自动闭包让你能够延迟求值，因为直到你调用这个闭包，代码段才会被执行。延迟求值对于那些
// 有副作用（Side Effect）和高计算成本的代码来说是很有益处的，因为它使得你能控制代码的执行时机。
// 下面的代码展示了闭包如何延时求值。
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func closuresFun() {
    
    print(customersInLine.count)// 5
    
    // 闭包
    let customerProvider = { customersInLine.remove(at: 0) }
    print(customersInLine.count)// 5
    
    print(customerProvider())// 调用闭包
    
    print(customersInLine.count)// 4

}

// 将闭包作为参数传递给函数时，你能获得同样的延时求值行为。
func serve(customer customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}

func serveFunc() {
    // 显式闭包
    serve(customer: { customersInLine.remove(at: 0) })
}

// 通过将参数标记为@autoclosure来接受一个自动闭包。customerProvider参数将自动转化一个闭包
func serve(customer customerProvider: @autoclosure () -> String) {
    print("Now serving \(customerProvider())!")
}

func serveFunc2() {
    serve(customer: customersInLine.remove(at: 0))
}

// 注意：过度使用autoclosure会让你的代码变得难以理解。

// 如果你想让一个自动闭包可以“逃逸”，则应该同时使用 @autoclosure 和 @escaping 属性。

var customerProviders: [() -> String] = []
func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
    customerProviders.append(customerProvider)
    // collectCustomerProviders(_:) 函数并没有调用传入的 customerProvider 闭包，
    // 而是将闭包追加到了 customerProviders 数组中。这个数组定义在函数作用域范围外，
    // 这意味着数组内的闭包能够在函数返回之后被调用。因此，customerProvider 参数必须
    // 允许“逃逸”出函数作用域。
}

func serveFunc3() {
    collectCustomerProviders(customersInLine.remove(at: 0))
    collectCustomerProviders(customersInLine.remove(at: 0))
    print("Collected \(customerProviders.count) closures.")
    
    for customerProvider in customerProviders {
        print("Now serving \(customerProvider())!")
    }
}








