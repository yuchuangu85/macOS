//
//  Swift05_ControlFlow.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// --- 控制流-----
// Swift提供了多种控制流结构，包括可以多次执行任务的while循环，条件if、guard和switch语句，
// 还有跳转位置的break、continue语句。Swift还提供了for-in循环，用来遍历数组，字典，区间，
// 字符串和其他序列类型

func controlFunc1() -> Void {
    // For-In循环
    let names = ["Anna", "Alex", "Brian", "Jack"]
    for name in names {
        print("Hello, \(name)")
    }
    
    // 遍历字典的键值对
    let numberOfLegs = ["spider": 8, "ant": 6, "cat": 4]
    for (animalName, legCout) in numberOfLegs {
        print("\(animalName)s have \(legCout)")
    }
    // 字典是无序的，遍历和插入都是无序的
    
    // 遍历范围
    for index in 1...5 {// 闭区间
        print("\(index) times 5 is \(index * 5)")
    }
    
    // 如果不需要区间中的每一项值，可以用下划线(_)替代忽略区间值
    let base = 3
    let power = 10
    var answer = 1
    for _ in 1...power {
        answer *= base
    }
    // 开区间
    let minutes = 60
    for tickMark in 0..<minutes {
        
    }
    
    // 开区间每隔多少执行一次
    let minuteInterval = 5
    for tickMark in stride(from: 0, to: minutes, by: minuteInterval) {
        // (0, 5, ... , 45, 55) 开区间
    }
    
    // 闭区间每隔多久执行一次
    let hours = 12
    let hourInterval = 3
    for tickMark in stride(from: 0, through: hours, by: hourInterval){
        // (3, 6, 9, 12)
    }
    
    // While循环
    // 语法:
    // while condition {
    //     code
    // }
    var n = 2
    while n < 100 {
        n *= 2
    }
    print(n)
    
    
    // Repeat-While:判断之前先执行一次，然后while条件成立再继续执行
    // 语法
    // repeat {
    //     statements
    // } while condition
    var m = 2
    repeat {
        m *= 2
    } while m < 100
    print(m)
    
    // 范围内
    var total = 0
    for i in 0..<4 {
        total += i
    }
    print(total)
    
    
    // 条件语句：Swift提供两种条件语句：if 和 switch
    // If语句：可以单独使用也可以和else一起用
    var temperatureInFahrenheit = 30
    if temperatureInFahrenheit <= 32 {
        print("It is cold. Consider wearing a scarf.")
    } else {
        print("It is not that cold. Wear a t-shirt.")
    }
    
    if temperatureInFahrenheit <= 32 {
        
    } else if temperatureInFahrenheit >= 40 {
        
    } else {
        
    }
    
    if temperatureInFahrenheit <= 32 {
        
    } else if temperatureInFahrenheit >= 86 {
        
    }
    
    // Switch语句
    let someCharacter: Character = "z"
    switch someCharacter {
    case "a":
        print("The first letter of the alphabet")
    case "z":
        print("The last letter of the alphabet")
    default:
        print("Some other character")
    }
    
    // 不存在隐式贯穿：Swift语法中，当匹配的case分支中的代码执行完毕后，程序会终止switch语句，
    // 而不是继续执行下个case分支。也就是不需要显示的使用break语句。
    // 每个case分支必须至少包含一条语句，否则无效的，例如下面的第一个case：
    let anotherCharacter: Character = "a"
    switch anotherCharacter {
    //case "a":// 无效的，因为case语句为空，报错
    case "A":
        print("The letter A")
    default:
        print("Not the letter A")
    }
    
    // 如果需要同时匹配两个条件，需要组合使用。为了可读性，匹配多个条件可以写成多行形式。
    switch anotherCharacter {
    case "a", "A":
        print("The letter A")
    default:
        print("Not letter A")
    }
    
    // 区间匹配
    let approximateCount = 62
    let countedThings = "moons orbiting Saturn"
    let naturalCount: String
    switch approximateCount {
    case 0:
        naturalCount = "no"
    case 1..<5:
        naturalCount = "a few"
    case 5..<12:
        naturalCount = "several"
    case 12..<100:
        naturalCount = "dozens of"
    default:
        naturalCount = "many"
    }
    print("There are \(naturalCount) \(countedThings)")
    
    // 元组：使用(_)来匹配所有可能的值
    let somePoint = (1, 1)
    switch somePoint {
    case (0, 0):
        print("\(somePoint) is at the origin")
    case (_, 0):
        print("\(somePoint) is at the x-axis")
    case (0, _):
        print("\(somePoint) is at the y-axis")
    case (-2...2, -2...2):
        print("\(somePoint) is at the box")
    default:
        print("\(somePoint) is outside of the box")
    }
    
    // 值绑定：case分支允许将匹配的值声明为临时常量或者变量，并且在case语句中使用。
    let anotherPoint = (2, 0)
    switch anotherPoint {
    case (let x, 0):// 判断anotherPoint是否在x轴上，如果是则x赋值为antherPoint的x值
        print("on the x-axis with an x value of \(x)")
    case (0, let y):// 判断anotherPoint是否在y轴上，如果是则x赋值为antherPoint的y值
        print("on the y-axis with an y value of \(y)")
    case let (x, y):// 匹配所有值，所以x是anotherPoint的x，y是anotherPoint的y值
        print("somewhere else at (\(x), \(y)")
    }
    
    // Where：case分支可以使用where来判断额外的条件
    let yetAnotherPoint = (1, -1)
    switch yetAnotherPoint {
    case let (x, y) where x == y:// 判断x是否等于y，如果等于，则赋值给前面的临时元组let (x, y)并执行下面语句
        print("(\(x), \(y)) is on the line x == y")
    case let (x, y) where x == -y:// 判断x是否等于-y，如果等于，则赋值给前面的临时元组let (x, y)并执行下面语句
        print("(\(x), \(y)) is on the line x == -y")
    case let (x, y):// 支持出上面两种情况外的所有情况，如果不满足上面的情况就直接复制给let (x, y)并执行下面语句
        print("(\(x), \(y)) is just some arbitrary point")
    }
    
    // 复合型Cases：当多个条件可以用同一种方法处理时，可以将这几种可能放在同一个case后面，并且用逗号隔开。
    // 只有case中一个匹配就会执行
    let someCharacter1: Character = "e"
    switch someCharacter1 {
    case "a", "e", "i":
        print("\(someCharacter1) is a vowel")
    case "b", "c", "d", "m",
             "l", "n":
        print("\(someCharacter1) is a consonant")
    default:
        print("\(someCharacter1) is not a vowel or a consonant")
    }
    
    // 先判断所给固定值是否匹配，匹配的话会将另一个值复制给临时变量distance，然后执行下面的case语句
    let stillAnotherPoint = (9, 0)
    switch stillAnotherPoint {
    case (let distance, 0), (0, let distance):
        print("On an axis, \(distance) frome the origin")
    default:
        print("Not on an axis")
    }
    
    // 控制转移语句：continue，break，fallthrough，return，throw
    // Continue
    let puzzleInput = "great minds think alike"
    var puzzleOutput = ""
    let charactersRemove: [Character] = ["a", "e", "i", "o", "u", " "]
    for character in puzzleInput {
        if charactersRemove.contains(character){
            continue
        } else {
            puzzleOutput.append(character)
        }
    }
    print(puzzleOutput)
    
    // Break： 循环语句中的break，switch语句中的break
    let numberSymbol: Character = "三"
    var possibleIntegerValue: Int?
    switch numberSymbol {
    case "1", "一":
        possibleIntegerValue = 1
    case "2", "二":
        possibleIntegerValue = 2
    case "3", "三":
        possibleIntegerValue = 3
    default://包含了出了上面三种情况的所有情况，default语句不需要做操作，因此用break结束
        break
    }
    
    // 贯穿：Swift中case语句执行一个就不会再执行另一个，如果需要继续执行另一个就需要用fallthrough关键字
    let integerToDescribe = 5
    var description = "The number \(integerToDescribe) is"
    switch integerToDescribe {
    case 2, 3, 4, 5, 7, 11, 13, 17, 19:
        description += "a prime number, and alse"
        fallthrough
    // 这里执行完继续执行default语句，如果下一个是case，它不在检查case中的条件是否匹配，而是直接执行下一个case中的代码
    default:
        description += " an integer."
    }
    print(description)
    
    // 带标签的语句
    // break显式的指明要终止哪个循环体或者条件语句，continue显式的指明想要影响哪一个循环体。使用一个标签来标记一个循环体或者
    // 条件语句，对于一个条件语句，你可以使用break加标签，来结束这个被标记的语句。对于一个循环语句，你可以使用break或者
    // continue加标签，来结束或者继续这条被标记语句的执行
    // 语法：
    // label name: while condition {
    //     statements
    // }
    
    let finalSquare = 25
    var board = [Int](repeating: 0, count: finalSquare + 1)
    board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
    board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    var square = 0
    var diceRoll = 0
    
    gameLoop: while square != finalSquare {
        diceRoll += 1
        if diceRoll == 7 {
            diceRoll = 1
        }
        
        while square != 100 {
            switch square + diceRoll {
            case finalSquare:
                break gameLoop// 如果只有一个循环，则不需要加标签，否则报错，跳出最外层循环
            case let newSqure where newSqure > finalSquare:
                continue gameLoop// 继续执行最外层循环，可以在单层循环使用
            default:
                square += diceRoll
                square += board[square]
            }
        }
        
    }
    print("Game over!")
    
}

// 提前退出
// guard的执行取决于一个表达式的布尔值。我们可以使用guard语句来要求条件必须为真时，以执行guard语句
// 后面的代码。不同于if，一个guard语句后面总是有一个else从句，如果条件不为真则执行else从句中的代码
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location)")
}
func greetFunc() -> Void {
    greet(person: ["name": "John"])
    greet(person: ["name": "Jane", "location": "Cupertino"])
}
// 如果guard语句被满足，则继续执行guard语句大括号外的代码。并将变量或者常量的可绑定作为guard语句的条件
// 都可以保护guard语句后面的代码

// 检测API可用性
// 语法：
// if #available(platform name version, ..., * {
//      statements to execute if the APIs are available
// } else {
//      fallback statements to execute if the APIs are unavailable
// }
func check() {
    if #available(iOS 10, macOS 10.12, *){
        
    } else {
        
    }
}














