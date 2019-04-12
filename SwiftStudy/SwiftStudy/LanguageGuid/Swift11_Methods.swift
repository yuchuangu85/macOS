//
//  Swift11_Methods.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// 实例方法
// 实例方法是属于某个特定类、结构体或者枚举类型实例的方法。实例方法提供访问和修改实例属性的方法或
// 提供与实例目的相关的功能，并以此来支撑实例的功能。实例方法的语法与函数完全一致

// 实例方法要写在它所属的类型的前后大括号之间。实例方法能够隐式访问它所属类型的所有的其他实例方法和属性。
// 实例方法只能被它所属的类的某个特定实例调用。实例方法不能脱离于现存的实例而被调用。
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}

func methsFuncA() {
    let counter = Counter()
    counter.increment()
    counter.increment(by: 5)
    counter.reset()
}

// self 属性
// 类型的每一个实例都有一个隐含属性叫做 self，self 完全等同于该实例本身。你可以在一个实例的
// 实例方法中使用这个隐含的 self 属性来引用当前实例。
class Counter1 {
    var count = 0
    func increment() {
        self.count += 1
    }
}

// 使用这条规则的主要场景是实例方法的某个参数名称与实例的某个属性名称相同的时候。在这种情况下，
// 参数名称享有优先权，并且在引用属性时必须使用一种更严格的方式。这时你可以使用 self 属性来区分
// 参数名称和属性名称。
struct Point1 {
    var x = 0.0, y = 0.0
    func isToTheRightOfx(_ x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point1(x: 4.0, y: 5.0)
func methsFuncB() {
    if somePoint.isToTheRightOfx(1.0) {
        print("This point is to the right of the line where x == 1.0")
    }
}

// 在方法中修改值类型
// 结构体和枚举是值类型。默认情况下，值类型的属性不能在它的实例方法中被修改。

// 但是，如果你确实需要在某个特定的方法中修改结构体或者枚举的属性，你可以为这个方法选择
// 可变（mutating）行为，然后就可以从其方法内部改变它的属性；并且这个方法做的任何改变都会
// 在方法执行结束时写回到原始结构中。方法还可以给它隐含的 self 属性赋予一个全新的实例，
// 这个新实例在方法结束时会替换现存实例。
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(_ deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
func methsFuncC() {
    somePoint2.moveBy(2.0, y: 3.0)// 这里修改了点，而不是一个新的点
    print("The point is now at (\(somePoint2.x), \(somePoint2.y)")
}

// 不能在结构体类型的常量（a constant of structure type）上调用可变方法，因为其属性不能被改变，
// 即使属性是变量属性
func methsFuncD() {
    let fixedPoint = Point2(x: 3.0, y: 3.0)
    // fixedPoint.moveBy(2.0, y: 3.0)  // 这里会报错
}

// 在可变方法中给self赋值
// 可变方法能够赋给隐含属性 self 一个全新的实例。
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point3(x: x + deltaX, y: y + deltaY)
    }
}

// 枚举的可变方法可以把 self 设置为同一枚举类型中不同的成员：
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = .Low
        case .Low:
            self = .High
        case .High:
            self = .Off
        }
    }
}
func methsFuncE() {
    var ovenLight = TriStateSwitch.Low
    ovenLight.next()// .High
    ovenLight.next()// .Off
}

// 类型方法
// 可以定义在类型本身上调用的方法，这种方法就叫做类型方法。在方法的 func 关键字之前加上关键字 static，
// 来指定类型方法。类还可以用关键字 class 来允许子类重写父类的方法实现。
class SomeClass1 {
    class func someTypeMethod() {
        
    }
}
func methsFuncF() {
    SomeClass1.someTypeMethod()
}
// 在类型方法的方法体（body）中，self 指向这个类型本身，而不是类型的某个实例。这意味着你可以用
// self 来消除类型属性和类型方法参数之间的歧义

// 一般来说，在类型方法的方法体中，任何未限定的方法和属性名称，可以被本类中其他的类型方法和类型属性引用。
// 一个类型方法可以直接通过类型方法的名称调用本类中的其它类型方法，而无需在方法名称前面加上类型名称。
// 类似地，在结构体和枚举中，也能够直接通过类型属性的名称访问本类中的类型属性，而不需要前面加上类型名称。
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1

    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }

    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }

    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }

}

class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

func methsFuncR() {
    var player = Player(name: "Argyrios")
    player.complete(level: 1)
    
    player = Player(name: "Beto")
    if player.tracker.advance(to: 6) {
        print("player is now on level 6 ")
    } else {
        print("level 6 has not yet been unlocked")
    }
}







