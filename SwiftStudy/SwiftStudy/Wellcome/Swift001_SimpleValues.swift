//
//  Swift001_SimpleValues.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 16/06/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
// 数据类型：let：常量；var：变量

import Foundation

// 常量：第一次必须有给定一个确切的值，不允许更改，如果更改会报错
let myConstant = 9

// 整数
let constantInteger = 10

// 小数：Double类型
let constantDouble = 90.3
let constant : Double = 23.3

// 值永远不会被隐式转换为其他类型。如果需要把一个值转换为其他类型，请显式转换
let label = "This width is "
let width = 20
let widthLabel = label + String(width);


//变量：初始化可以不赋值，也可以赋值，也可以之后再更改值(要在函数中改变)
var myVariable = 10;
//myVariable = 13

// 有一种更简单的把值转换成字符串的方法：把值写到括号中，并且在括号之前写一个反斜杠
// 在String字符串中插入数字：\(数字)，放置在字符串中
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples"
let orangeSummary = "I have \(oranges) oranges"

// 使用方括号[]来创建一个数组或者字典，并且使用下标或者键（key）来访问元素，最后一个元素后面允许有个逗号
// 数组
var shoppingList = ["catfish","water",
                    "tulips","blue paint"]

func func1() -> Void {
    // 使用下标来访问元素
    shoppingList[1] = "bottle of water"
}

// 字典
var occupation = [
    "Malcolm":"Caption",
    "Kaylee":"Machinc"
]

func func2() -> Void {
    // 使用键来访问元素并且修改
    occupation["Jayne"] = "Public Relations"
    // 更新字典，这个函数会返回一个字典值类型的可选值，但是这个方法返回更新之前的值
    occupation.updateValue("Jayne", forKey: "abs")
    // 移除某个值
    occupation["Jaync"] = nil
    occupation.removeValue(forKey: "Jaync")
    
    // 将字典的键或者值构造一个新数组
    let occs = Array(occupation.values)
    let occs2 = Array(occupation.keys)
    
}

// 创建空的数组和字典，使用初始化语法
let emptyArray = [String]()
let emptyDictionary = [String:Float]()

// 如果可以推断类型信息，可以做如下初始化
func func3() -> Void {
    shoppingList = []
    occupation = [:]
}


// 控制流：使用if和switch来进行条件操作，使用for-in, for, while, repeat-while来进行循环。
// 包裹条件和循环变量的括号可以省略，但是语句体的大括号是必须的
func func4() -> Void {
    var individualScores = [75, 43, 50 ,100, 89]
    var teamScore = 0
    for score in individualScores{
        // 在if语句中，条件必须是一个布尔表达式
        if score > 50 {
            teamScore += 3
        } else {
            teamScore += 1
        }
    }
    print(teamScore)
    
    // 数组追加
    individualScores.append(20)
    let arrayq1 = [10, 20]
    let array2 = [20, 30]
    let array3 = arrayq1 + array2
    print(array3)
    
    let optionalString : String? = "Hello"
    print(optionalString == nil)
    
    // 在类型后面添加一个问号（？）来标记这个值是可选的，这个值可能是一个确切值也可能是nil，
    // 这里赋值了一个确切值，但是程序中可能为确切值，可能为nil，因此用可选
    let optionName: String? = "John"
    var greeting = "Hello!"
    
    // 你可以一起使用if和let来处理缺失的情况。这些值可由可选值来代表。一个可选值是一个具体的值
    // 或者是nil以表示值缺失。在类型后面加一个问号来标记这个变量的值是可选的。
    // 如果可选值（optionName）是nil，这个条件语句就是false，那么，下面代码就会跳过，
    // 如果不是nil，那么后面的值就会赋值给name，并且执行if语句块代码（因为optionName在执行
    // 程序的过程中可能为nil也可能不是，就像我们的空判断）
    if let name = optionName {
        greeting = "Hello , \(name)"
    }
    print(greeting)
    
    // 还有一种可选值为空的处理方式，就是用??来提供一个默认值，也就是如果nickName是nil，
    // 那么就用后面的fullName
    let nickName: String? = nil
    let fullName: String = "John"
    let infomalGreeting = "Hi \(nickName ?? fullName)"
    print(infomalGreeting)
    
    // 断言：判断一个逻辑条件是否为true，如果为true会执行，false则会停止
    let age = -3
    assert(age >= 0, "A Person's age connot be less than zero")
    assert(age >= 0)
    // 因为age小于0，所以断言会触发
    // 断言的使用场景：
    // 整数的附属脚本索引被传入一个自定义附属脚本实现，但是下标索引值可能太小或者太大
    // 需要给函数传入一个值，但是非法的值可能导致函数不能正常执行
    // 一个可选值现在是nil，但是后面的代码运行需要一个非nil值
    
}

/* switch：支持任何数据类型和多种比执行完语句中对应的case语句就会退出，不需要再case语句结尾添加break */
func funcSwitch() -> Void {
    let vegetable = "red repper"
    switch vegetable {
    case "celery":
        print("“Add some raisins and make ants on a log.")
    case "cucumber", "watercress":// 多个选择
        print("That would make a good tea sandwich.")
    case let x where x.hasSuffix("repper"):// 条件语句，hasSuffix：以什么结尾，如果以这个结尾，就将该值复制给x
        print("It is a spicy \(x)")
        fallthrough // 使用该关键字使代码执行完落入default语句中
    default:// 默认语句
        print("Everything tastes good in soup.")
    }
}

// 可以用for-in循环通过键值对的形式对字典进行迭代，字典是无序的，随意迭代也是随机的
func funcForIn() -> Void {
    let interestingNumbers = [
        "Prime":[2,3,5,7,11,13],
        "Fibonacci":[1,1,2,3,5,8],
        "Square":[1,4,9,16,25]
    ]
    
    var largest = 0
    var kindName = ""
    for (kind, numbers) in interestingNumbers {
        for number in numbers {
            if number > largest {
                largest = number
                kindName = kind
            }
        }
    }
    print(largest)
    print(kindName)
}


// while循环，
func funcWhile() -> Void {
    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n)
    
    // 循环至少执行一次
    var m = 2
    repeat {
        m *= 2
    }while m < 100
    print(m)
    
    let finalSquare = 25
    var board = [Int](repeating: 0, count: finalSquare + 1)
    board[03] = +08; board[06] = +11; board[09] = +09;board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    var square = 0
    var deceRoll = 0
    
    gameLoop: while square != finalSquare {
        deceRoll += 1
        if deceRoll == 7{
            deceRoll = 1
        }
        switch square + deceRoll {
            case finalSquare:
            break gameLoop // 跳转到while循环体后的第一行代码，结束，如果没有gameLoop则只会中断switch不会中断while循环，gameLoop表明要中断哪个代码块
        case let newSquare where newSquare > finalSquare:
            continue gameLoop // 结束本次循环迭代，开始下次循环迭代
        default:
            square += deceRoll
            square += board[square]
            
        }
    }
    
    
    
    
    // for语句中使用"..<"表示一个范围,半闭区间，不包含上界；“...”表示一个范围，闭区间
    var total = 0
    for i in 0..<4 {
        total += i
    }
    print(total)
    
    // 反序循环
    for i in (0..<10).reversed() {
        print(i)
    }
    
}















