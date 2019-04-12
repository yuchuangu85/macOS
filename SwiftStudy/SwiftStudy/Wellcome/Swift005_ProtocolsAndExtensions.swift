//
//  Swift005_ProtocolsAndExtensions.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 20/07/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
// Protocols（协议） and Extensions（扩展）

import Foundation

// 使用protocol来声明一个协议
protocol ExampleProtocol {
    var simpleDescription: String { get }
    // 约定方法，如果方法中有参数，该参数不能有默认值，mutating是表示可修改的。
    mutating func adjust()
}

// 类，枚举，和结构都可以实现协议
class SimpleClass : ExampleProtocol {
    var simpleDescription: String = "A very simple class"
    var anotherProperty: Int = 69015
    // 类中带有mutating接口，因此用mutating修饰
    func adjust() {
        simpleDescription += " Now 100% adjust"
    }
}

class Class1 {
    init() {
        let a = SimpleClass()
        a.adjust()
        let aDescription = a.simpleDescription
        print(aDescription)
    }
}

struct SimpleStruct: ExampleProtocol {
    var simpleDescription: String = "A very simple struct"
    // mutating：表示可修改的
    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}

class Class2 {
    init() {
        var b = SimpleStruct()
        b.adjust()
        let aDesciption = b.simpleDescription
        print(aDesciption)
    }
}

// 扩展：对已声明的协议补充额外的默认行为。使用extension来为现有的类型添加功能，比如新的方法和计算属性。你可以使用扩展在别处修改定义，甚至是从外部库或者框架引入一个类型，使得这个类型遵循某个协议。
// 当你处理类型是协议的值时，协议外定义的方法不可用。
extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}

class Class3 {
    init() {
        print(7.simpleDescription)
        let protocolValue: ExampleProtocol = 1
        print(protocolValue.simpleDescription)
    }
}


