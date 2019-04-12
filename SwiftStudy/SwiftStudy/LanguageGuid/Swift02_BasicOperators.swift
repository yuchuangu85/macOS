//
//  BasicOperators.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/23.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

class Operators {
    
    //-------Assignment Operator(赋值操作符)--------------
    let b = 10
    var a = 5
    
    let (x, y) = (1, 2)
    func func0() -> Void {
        if x == y {
            
        }
    }
    
    //-------Arithmetic Operator(算数操作符)--------------
    // Addition (+),Subtraction(-),Multiplication(*),Division(/)
    
    // -------Rmainder Operator(取模运算符)--------------
    // % 取余数
    
    // --------Unary Minus Operator (一元减运算符)-------------
    let three = 3
    func func1() -> Void {
        let minusThress = -three
        let plusThree = -minusThress
    }
    
    // --------Unary Plus Operator (一元加运算符)-------------
    let minusSix = -6
    func func2() -> Void {
        let alsoMinusSix = +minusSix
    }
    
    // ---------Compound Assignment Operators (复合赋值运算符)------------
    
    func func3() -> Void {
        var a = 1
        a += 2
    }
    
    // -------Comparison Operators(比较运算符) -------------
    // Equal to (a == b)
    // Not equal to (a != b)
    // Greater than (a > b)
    // Less than (a < b)
    // Greater than or equal to (a >= b)
    // Less than or equal to (a <= b)
    func func4() -> Void {
        let name = "World"
        if name == "World" {
            
        } else {
            
        }
        // 元组也可以用于比较，从左到右开始比较单个元素，String要比较第一个字母的顺序
        (1, "zbra") < (2, "apple")//true: 1<2，所以不再比较后面的
        (3, "apple") < (3, "bird")//true:3==3,因此要比较后面的，而apple小于bird
        (4, "dog") == (4, "dog")// true:两个都行相等
        // Bool值不能用来比较
    }
    
    // ------- Identity Operators(恒等运算符)------------
    // === or !== ：用来比较两个引用是否指向同一个对象
    
    // ------- Ternary Conditional Operator (三元条件运算符)---------
    func func5() -> Void {
        let contentHeight = 40
        let hasHeader = true
        let rowHeight = contentHeight + (hasHeader ? 50 : 20)
    }
    
    // -------- Nil-Coalescing Operator (空值合并运算符)-------
    func func6() -> Void {
        a ?? b
        a != nil ? a : b
        // a != nil ? a! : b
        
        let defaultColorName = "red"
        var userDefinedColorName: String? // defaults to nil
        var colorNameToUse = userDefinedColorName ?? defaultColorName //userDefinedColorName is nil, so colorNameToUse is set to the default of "red"
        
    }
    
    // -------- Range Operators(范围运算符)--------------
    func func7() -> Void {
        // 闭区间(Closed Range Operator)：
        for index in 1...5 {
            
        }
        
        // 半开区间(Half-Open Range Operator)：
        let names = ["Anna", "Alex", "Brian", "Jack"]
        let count = names.count
        for i in 0..<count {
            
        }
        
        // 半边区间(One-Sided Ranges)
        for name in names[2...] {// 从2开始
            
        }
        for name in names[...2] {// 从0到2
            
        }
        for name in names[..<2] {// 从0到1
            
        }
        let range = ...5 // 小于等于5的所有值
        
    }
    
    // --------- Logical Operators (逻辑运算符) ----------
    // Logical NOT (!a)
    // Logical AND (a && b)
    // Logical OR (a || b)
    
    
    
    
    
    
    
    
    
    
    
}



