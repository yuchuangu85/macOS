//
//  Swift003_ObjectsAndClasses.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 14/07/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
//  Objects（对象）And Classes（类）

import Foundation

// 用class关键字后面跟随名字来创建一个类。一个类中属性的声明和变量、常量声明是一样的，唯一区别是它们的上下文是类。同样，方法和函数的声明也是一样的。
class Shape {
    // 属性声明
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

class class1 {
    init() {
        // 创建一个类的实例，使用点语法来访问实例的属性和方法
        let shape = Shape()
        shape.numberOfSides = 7
        let shapeDescription = shape.simpleDescription()
        print(shapeDescription)
    }
}

// 这个Shape类丢失了一个重要的东西：当一个实例创建的时候设置类初始化的方法，用init来创建一个构造器
class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    // 注意self被用来区别实例变量。
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides"
    }
}

// 继承：子类名称，冒号，父类名称
class Square: NamedShape {
    var sideLength: Double
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }
    
    func area() -> Double {
        return sideLength * sideLength
    }
    
    // 重写父类的方法，要用override标记
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)"
    }
}

class class2 {
    init() {
        let test = Square(sideLength: 5.2, name: "my test square")
        print(test.area())
        print(test.simpleDescription())
    }
}

// 除了存储简单属性之外，属性还有getter和setter
class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    // 该构造函数执行了三步：
    // 1.设置子类声明的属性值
    // 2.调用父类的构造函数
    // 3.改变父类定义的属性值。其他的工作比如调用方法、getters和setters也可以在这个阶段完成
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    var perimeter: Double {
        get{
            return 3.0 * sideLength
        }
        
        set{
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
    
}

class class3 {
    init() {
        let triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
        print(triangle.perimeter)
        triangle.perimeter = 9.9
        print(triangle.sideLength)
    }
}

// 在perimeter的set方法中有一个含蓄的值：newValue。你可以在set括号内提供一个明确的值
// 如果不需要计算属性，但是扔然需要再设置一个新值之前或者之后运行代码，使用willSet和didSet
class TringleAndSquare {
    var tringle : EquilateralTriangle{
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    
    var square: Square{
        willSet {
            tringle.sideLength = newValue.sideLength
        }
    }
    
    init(size: Double, name: String ) {
        square = Square(sideLength: size, name: name)
        tringle = EquilateralTriangle(sideLength: size, name: name)
    }
}

class class4 {
    init() {
        let tringleAndSquare = TringleAndSquare(size: 10, name: "Another test shape")
        print(tringleAndSquare.square.sideLength)
        print(tringleAndSquare.tringle.sideLength)
        tringleAndSquare.square = Square(sideLength: 50, name: "largar square")
        print(tringleAndSquare.tringle.sideLength)
        
        // 选择语句：将?放在操作前面，例如：方法，属性，下标索引。如果?前面是nil，
        // 那么?后面的值都被忽略，如果?前面不是nil，那么就会拆包，然后对拆包的值进行操作，
        // 来确保安全，将后面的值赋值给前面
        let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
        var sideLength = optionalSquare?.sideLength
        if sideLength == nil {
            sideLength = 1.0
        }
        print(sideLength)
    }
}




