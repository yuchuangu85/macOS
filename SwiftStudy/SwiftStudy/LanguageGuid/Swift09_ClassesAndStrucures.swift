//
//  Swift09_ClassesAndStrucures.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// Swift 中类和结构体有很多共同点:
// 1.定义属性用于存储值
// 2.定义方法用于提供功能
// 3.定义下标操作通过下标语法可以访问它们的值
// 4.定义构造器用于生产初始化值
// 5.通过扩展增加默认实现的功能
// 6.遵循协议以提高某种标准功能

// 与结构体相比类还有以下附加功能：
// 1.继承允许一个类继承另一个类的特征
// 2.类型转换允许在运行时检查和解释一个类实例的类型
// 3.析构器允许一个类实例释放任何其所被分配的资源
// 4.引用计数允许对一个类多次引用

// 定义语法：
class SomeClass {
    // 定义类的内容
}

struct SomeStructure {
    // 定义结构体
}

// 实例
struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

// 类和结构体实例
// 生成结构体和类实例语法很相似
let someResolution = Resolution()
let someVideoMode = VideoMode()

// 属性访问
// 点语法
func strucuresFuncA() {
    print("The width of someResolution is \(someResolution.width)")
    
    print("The width of someVideoMode is \(someVideoMode.resolution.width)")
    
    // 使用点语法赋值
    someVideoMode.resolution.width = 1280
    print("The width of someVideoMode is \(someVideoMode.resolution.width)")
}

// 结构体类型的成员逐一构造器
// 所有结构体都有一个自动生成的成员逐一构造器，用于初始化新结构体实例中成员的属性。新实例中各个属性的初始化值可以
// 通过属性的名称传递到成员逐一构造器中：
let vga = Resolution(width: 640, height: 480)
// 与结构体不同，类实例没有默认的成员逐一构造器。

// 结构体和枚举是值类型
// 值类型被赋予给一个变量、常量或者被传递给一个函数的时候，其值会被拷贝
// 实际上，在 Swift 中，所有的基本类型：整数（Integers）、浮点数（floating-point numbers）、
// 布尔值（Booleans）、字符串（strings)、数组（arrays）和字典（dictionaries），都是值类型，
// 并且在底层都是以结构体的形式所实现。
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
// 由于Resolution是一个结构体，所以cinema是一个hd的拷贝副本，而不是hd本身。cinema和hd是两个不同的实例

// 修改
func strucuresFunc() {
    cinema.width = 2048
    print("cinema is now \(cinema.width) pixels wide")// 2048
    
    print("hd is still \(hd.width) pixels wide")// 1920
}

// 枚举也是一样
var currentDirection = CompassPoint.west
let rememberedDirection = currentDirection
func strucuresFuncD() {
    currentDirection = .east
    if rememberedDirection == .west {
        print("The remembered direction is still .West")// 会打印此行
    }
}

// 类是引用类型
// 与值类型不同，引用类型在被赋予到一个变量、常量或者被传递到一个函数时，其值不会被拷贝。引用的是已存在的实例本身
func strucuresFuncB() {
    let tenEighty = VideoMode()
    tenEighty.resolution = hd
    tenEighty.interlaced = true
    tenEighty.name = "1080i"
    tenEighty.frameRate = 25.0
    
    let alsoTenEighty = tenEighty// 因为是类引用，所以alsoTenEighty和tenEighty引用同一个VideoMode实例
    alsoTenEighty.frameRate = 30.0
    
    print("The frameRate property of tenEight is now \(tenEighty.frameRate)")// 30.0
    
    // 恒等运算符
    // 因为类是引用类型，所以存在多个常量和变量同事引用同一个类实例的情况，就需要恒等在判断
    // 等价于（===）：表示两个类型（Class type）的常量或者变量引用同一个类实例
    // 不等价于（!==）：表示两个实例的值相等或者相同，判定时要遵循设计者定义的评判标准，因此相对于相等来说，这厮一种更合适的叫法
    if tenEighty === alsoTenEighty {
        print("tenEight and alsoTenEighty refer to the same Resolution instance.")
    }
    
}


