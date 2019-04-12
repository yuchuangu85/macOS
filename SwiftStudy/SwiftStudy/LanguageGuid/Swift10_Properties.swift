//
//  Swift10_Properties.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// 属性将值跟特定的类、结构和枚举关联。存储属性存储常量和变量作为实例的一部分，而计算属性计算一个值。计算属性可用于类，
// 结构体和枚举，存储属性只用于类和结构体

// 存储属性和计算属性通常与特定类型的实例关联。但是，属性也可以直接作用于类型本身，这种属性称为类型属性。
// 另外，还可以定义属性观察器来监控属性值的变化，以此来触发一个自定义的操作。属性观察器可以添加到自己
// 定义的存储属性上，也可以添加到从父类继承的属性上。

// 存储属性
// 简单来说，一个存储属性就是存储在特定类或者结构体实例里的一个常量或者变量。存储属性可以是变量存储属性，也可以
// 是常量存储属性

struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// 该区间表示整数：0， 1， 2
func swiftFuncA() {
    rangeOfThreeItems.firstValue = 6
    // 该区间表示整数：6，7，8
}

// 常量结构体的存储属性
// 如果创建了一个结构体的实例并将其赋值给一个常量，则无法修改该实例的任何属性，即使有属性被声明为变量也不行：
func swiftFuncB() {
    let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
    // rangeOfFourItems.firstValue = 6 // 会报错，不允许修改
    
    // 这种行为是由于结构体（struct）属于值类型。当值类型的实例被声明为常量的时候，它的所有属性也就成了常量。
    
    // 属于引用类型的类（class）则不一样。把一个引用类型的实例赋给一个常量后，仍然可以修改该实例的变量属性。
}

// 延迟存储属性
// 延迟存储属性是指第一次被调用的时候才会计算其初始值的属性。在属性声明前使用lazy来表示一个延时存储属性
// 必须将延迟存储属性声明成变量（使用 var 关键字），因为属性的初始值可能在实例构造完成之后才会得到。
// 而常量属性在构造过程完成之前必须要有初始值，因此无法声明成延迟属性。
class DataImporter {
    /*
     DataImporter 是一个负责将外部文件中的数据导入的类。
     这个类的初始化会消耗不少的时间
     */
    var fileName = "data.txt"
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
func swiftFuncC(){
    let manager = DataManager()
    manager.data.append("Some data")
    manager.data.append("Some data more")
    // DataImporter实例的importer属性还没有被创建
    
    // 由于使用了lazy，importer属性只有第一次被访问的时候才创建
    print(manager.importer.fileName)// importer属性被创建了
}
// 注意：如果一个被标记为 lazy 的属性在没有初始化时就同时被多个线程访问，则无法保证该属性只会被初始化一次。

// 计算属性
// 计算属性不直接存储值，而是提供一个getter和一个可选的setter，来间接获取和设置其他属性或者变量的值
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}

var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
func swiftFunc() {
    square.center = Point(x: 15.0, y: 15.0)
    print("square.origin is now at (\(square.origin.x), \(square.origin.y)")// (10.0, 10.0)
}
// square 的center属性可以通过点运算符来访问，这会调用该属性的getter来获取它的值。跟直接返回已经存在的值不同。
// getter实际上通过计算然后返回一个新的Point来表示square的中心店。
// center属性之后被设置了一个新的值(15, 15)，表示向右上方移动正方形。设置属性center的值会调用它的setter来修改属性。

// 简化setter声明
struct AlternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}

// 只读计算属性
// 只有getter没有setter的计算属性就是只读计算属性。只读计算属性总是返回一个值，可以通过点运算符访问，但不能设置新的值
// 注意：必须使用 var 关键字定义计算属性，包括只读计算属性，因为它们的值不是固定的。let 关键字只用来声明常量属性，
//      表示初始化后再也无法修改的值。
// 只读属性的声明可以去掉get关键字和大括号
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {// 只读属性
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)

// 属性观察器
// 属性观察器监控和响应属性值的变化，每次属性被设置值的时候都会调用属性观察器，即使新值和当前值相同的时候也不例外。
// 你可以为除了延迟存储属性之外的其他存储属性添加属性观察器，也可以通过重写属性的方式为继承的属性
//（包括存储属性和计算属性）添加属性观察器。你不必为非重写的计算属性添加属性观察器，因为可以通过它的
// setter 直接监控和响应值的变化。
// 可以为属性添加如下的一个或者全部观察器
// 1.willSet在新的值被升值之前调用
// 2.didSet在新的值被设定之后立即调用

// willSet 观察器会将新的属性值作为常量参数传入，在 willSet 的实现代码中可以为这个参数指定一个名称，
// 如果不指定则参数仍然可用，这时使用默认名称 newValue 表示。
// 同样，didSet 观察器会将旧的属性值作为参数传入，可以为该参数命名或者使用默认参数名 oldValue。
// 如果在 didSet 方法中再次对该属性赋值，那么新值会覆盖旧的值。

// 父类的属性在子类的构造器中被赋值时，它在父类中的 willSet 和 didSet 观察器会被调用，
// 随后才会调用子类的观察器。在父类初始化方法调用之前，子类给属性赋值时，观察器不会被调用。

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
func swiftFuncD() {
    stepCounter.totalSteps = 200
    // About to set totalSteps to 200
    // Added 200 steps
    stepCounter.totalSteps = 360
    // About to set totalSteps to 360
    // Added 160 steps
}
// StepCounter 类定义了一个 Int 类型的属性 totalSteps，它是一个存储属性，包含 willSet 和 didSet 观察器。

// 当 totalSteps 被设置新值的时候，它的 willSet 和 didSet 观察器都会被调用，即使新值和当前值完全相同时也会被调用。

// 如果将属性通过 in-out 方式传入函数，willSet 和 didSet 也会调用。这是因为 in-out 参数采用了
// 拷入拷出模式：即在函数内部使用的是参数的 copy，函数结束后，又对参数重新赋值。

// 全局变量和局部变量
// 全局变量是在函数、方法、闭包或任何类型之外定义的变量。局部变量是在函数、方法或闭包内部定义的变量。

// 全局的常量或变量都是延迟计算的，跟延迟存储属性相似，不同的地方在于，全局的常量或变量不需要标记 lazy 修饰符。
// 局部范围的常量或变量从不延迟计算。

// 类型属性
// 实例属性属于一个特定类型的实例，每创建一个实例，实例都拥有属于自己的一套属性值，实例之间的属性相互独立。
// 也可以为类型本身定义属性，无论创建了多少个该类型的实例，这些属性都只有唯一一份。这种属性就是类型属性。

// 跟实例的存储型属性不同，必须给存储型类型属性指定默认值，因为类型本身没有构造器，也就无法在初始化过程
// 中使用构造器给类型属性赋值。

// 存储型类型属性是延迟初始化的，它们只有在第一次被访问的时候才会被初始化。即使它们被多个线程同时访问，
// 系统也保证只会对其进行一次初始化，并且不需要对其使用 lazy 修饰符。

// 类型属性语法
// Swift 中，类型属性是作为类型定义的一部分写在类型最外层的花括号内，因此它的作用范围也就在类型支持的范围内。
// 使用关键字 static 来定义类型属性。在为类定义计算型类型属性时，可以改用关键字 class 来支持子类对
// 父类的实现进行重写。
struct SomeStructure1 {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}

enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}

class SomeClass2 {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 27
    }
    class var overrideableComputedTypeProperty: Int {
        return 107
    }
}

// 获取和设置类型属性的值
func swiftFuncE() {
    print(SomeStructure1.storedTypeProperty)
    SomeStructure1.storedTypeProperty = "Another value"// 赋值
    print(SomeStructure1.storedTypeProperty)
    
    print(SomeEnumeration.computedTypeProperty)
    print(SomeEnumeration.storedTypeProperty)
}

struct AudioChannel {
    static let thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {// 属性观察器
            if currentLevel > AudioChannel.thresholdLevel {
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}

func swiftFuncF() {
    var leftChannel = AudioChannel()
    var rightChannel = AudioChannel()
    leftChannel.currentLevel = 7 // 触发属性观察器
    print(leftChannel.currentLevel) // 7
    
    print(AudioChannel.maxInputLevelForAllChannels) // 7
    
    rightChannel.currentLevel = 11
    print(rightChannel.currentLevel) // 10
    
    print(AudioChannel.maxInputLevelForAllChannels) // 10
    
}



