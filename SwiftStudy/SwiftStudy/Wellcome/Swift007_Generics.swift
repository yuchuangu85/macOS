//
//  Swift007_ Generics.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 20/07/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
//  Generics（泛型）

import Foundation

// 在尖括号里写一个名字来创建一个泛型函数或者类型
class GenericsDemo{
    
    init() {
        makeArry(repeating: "knock", numberOfTimes: 4)
    }
    
    func makeArry<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
        var result = [Item]()
        for _ in 0..<numberOfTimes {
            result.append(item)
        }
        return result
    }
    
    // 你也可以创建泛型函数、方法、类、枚举和结构体
    enum OptionalValue<Wrapped> {
        case none
        case some(Wrapped)
    }
    
    func func1() -> Void {
        var possibleInteger: OptionalValue<Int> = .none
        possibleInteger = .some(100)
    }
    
    // 在类型后面使用where来指定对类型的需求，比如，限定类型实现某一个协议，限定两个类型是相同的，或者限制某个类必须有一个特定的父类。<T: Equatable> 和 <T> ... where T: Equatable>是等价的。
    func anyCommonElement<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
        where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
    }
    
    func func2() -> Void {
        anyCommonElement([1, 2, 3], [3])
    }
    
}
