//
//  Swift04_CollectionTypes.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// Swift语言提供了三种基本集合类型：Arrays，Sets，Dictionaries，用来存储集合数据。
// Arrays（数组）是有序集合，Sets（集合）是无序不重复集合，Dictionaries（字典）是无序键值对集合

// 集合的可变性：如果Arrays，Sets，Dictionaries被声明为变量，那么这个集合就是可变的，也就是你可以
// 添加、删除、或者改变集合里面的数值。如果你声明为常量，那么它就是不可变的，它的大小和内容都不能被改变。

// 数组（Arrays）
// 数组无序存储相同类型的值。相同的值可以多次出现在数组不同的位置

// 创建一个空数组
var someInts = [Int]()// Int类型值的数组

func arrayFunc() -> Void {
    // 可以根据上下文来判断数组值的类型
    someInts.append(3)// 数组类型值为Int
    someInts = [] // 创建空数组，类型仍然是Int
    
    // 创建带有默认值的数组
    var threeDoubles = Array(repeating: 0.0, count: 3)
    
    // 通过两个数组相加创建一个数组
    var anotherThreeDoubles = Array(repeating: 2.5, count: 3)
    var sixDoubles = threeDoubles + anotherThreeDoubles
    
    // 用数组字面量构造数组
    // [value 1, value 2, value 3]
    // 字符串类型数组：[String]
    var shoppingList: [String] = ["Egg", "Milk"]
    // 由于Swift类型推断机制，我们可以省略类型声明简化为：
    shoppingList = ["Egg", "Milk"]
    
    // 访问和修改数组
    var count = shoppingList.count
    if shoppingList.isEmpty {
        
    }
    
    // 添加新值到数组的末尾
    shoppingList.append("Flour")
    shoppingList += ["Baking Powder"]
    shoppingList += ["Chocolate Spread", "Cheese"]
    
    // 通过下标获取数组中的对应值
    var firstItem = shoppingList[0]
    // 通过下标改变对应值
    shoppingList[0] = "Six eggs"
    
    // 通过下标范围一次性改变一系列值
    shoppingList[4...6] = ["Bananas", "Apples"]
    
    // 插入值
    shoppingList.insert("Maple Syrup", at: 0)
    
    // 删除
    shoppingList.remove(at: 0)
    
    // 移除最后一个
    shoppingList.removeLast()
    
    // 数组遍历
    for item in shoppingList {
        print(item)
    }
    
    // 带有索引值的遍历
    for (index, value) in shoppingList.enumerated() {
        print("Item \(index + 1): \(value)")
    }
    
    // 集合：无序，相同值只有一个
    // 集合类型的哈希值：一个类型为了存储在集合中，该类型必须是哈希化的，也就是说，该类型必须提供一个方法
    // 来计算它的哈希值。一个哈希值是Int类型的，相等的对象哈希值必须相同，比如：a == b， 因此必须
    // a.hashValue == b.hasValue.
    // Swift的所有基本类型（String，Int，Double和Bool）默认都是可哈希化的，可以作为集合的值的类型或者字典的
    // 键的类型。没有关联值的枚举成员值默认也是可以哈希化的。
    
    // 集合类型语法
    // 创建和构造一个空集合
    var letters = Set<Character>()
    
    // 根据上下文创建空集合
    letters.insert("a")
    letters = []// 根据上面插入值可以判断集合中值类型为Character
    
    // 用数组字面量创建集合
    var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
    // Swift中可以进行类型推断，因此，如果使用数组字面量构造一个集合，那么要保证数组中的元素类型相同，那么
    // 你就可以不用写出Set的类型
    var favoritegenress: Set = ["Rock", "Classical", "Hip hop"]
    
    // 访问和修改一个集合
    print("I have \(favoriteGenres.count) favorite music genres")
    
    if favoriteGenres.isEmpty {
        
    }
    
    favoriteGenres.insert("Jazz")
    
    // 如果删除的元素有，则返回该元素并且赋值给removedGenre，否则返回nil，走else语句
    if let removedGenre = favoriteGenres.remove("Rock") {
        
    }
    
    if favoriteGenres.contains("Funk") {
    
    }
    
    // 遍历集合
    for genre in favoriteGenres {
        
    }
    
    // Set类型没有特定顺序，如果需要按照特性顺序来，那么可以使用sorted()方法，它将返回一个有序数组，
    // 这个数组的元素排列顺序由操作符'<'对元素进行比较的结果来确定的
    for genre in favoriteGenres.sorted() {
        
    }
    
    // 集合操作
    // 基本集合操作
    // 使用intersection(_:)方法根据两个集合中都包含的值来创建的一个新的集合
    // 使用symmetricDifferent(_:)方法根据在一个集合中但不在两个集合中的值创建一个新的集合
    // 使用union(_:)方法根据两个集合的值创建一个新的集合
    // 使用subtracting(_:)方法根据不在该集合中的值创建一个新的集合
    let oddDigits: Set = [1, 3, 5, 7, 9]
    let evenDigits: Set = [0, 2, 4, 6, 8]
    let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]
    oddDigits.union(evenDigits).sorted()// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    oddDigits.intersection(evenDigits).sorted()// []
    oddDigits.subtracting(singleDigitPrimeNumbers).sorted()// [1, 9]
    oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()// [1, 2, 9]
    
    // 集合成员关系和相等
    // 使用“是否相等”运算符（==）来判断两个集合是否包含全部相同的元素
    // 使用isSubset(of:)方法来判断一个集合中的值是否也被包含在另外一个集合中
    // 使用isSuperset(of:)方法来判断一个集合中包含另一个集合中所有的值
    // 使用isStrictSubset(of:)或者isStrictSuperset(of:)方法来判断一个集合是否是另一个集合的子集合或者父集合并且两个集合不相等
    // 使用isDisjoint(with:)方法来判断两个集合是否是不含有相同的值（是否没有交集）
    let houseAnimals: Set = ["dog", "cat"]
    let farmAnimals: Set = ["Wow", "bird", "pig", "dog", "cat"]
    let cityAnimals: Set = ["panda"]
    houseAnimals.isSubset(of: farmAnimals)// true
    farmAnimals.isSuperset(of: houseAnimals)// true
    farmAnimals.isDisjoint(with: cityAnimals)// true
    
    // 字典
    // 字典是以键值对形式存储多个相同类型值的容器。
    
    // 字典类型语法：Dictionary<Key, Value>
    // 创建空字典
    var namesOfIntegers = [Int: String]()
    // 推断
    namesOfIntegers[16] = "sixteen"// 16是键，后面是值
    namesOfIntegers = [:]
    
    // 用字面量创建字典
    // [key 1: value 1, key 2: value 2, key 3: value 3]
    var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    
    // 简化
    var airport =  ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
    
    // 访问和修改字典
    print("The airports dictionary contains \(airports.count) items.")
    if airports.isEmpty {
        
    }
    
    // 下标
    airports["LHR"] = "London"
    
    // 通过下标修改
    airports["LHR"] = "London Heathrow"
    
    // 通过updateValue(_:forKey:)方法可以设置或者更新特定键对应的值。键不存在就会设置新的，存在就会更新
    // 这个方法会返回更新值之前的原值，这样我们可以检查更新是否成功
    // updateValue(_:forKey:)方法会返回对应值的可选值。
    if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
        print("The old value for DUB was \(oldValue).")
    }
    
    // 通过下标获取值
    if let airportName = airports["DUB"] {
        
    }
    
    airports["APL"] = "Apple International"
    airports["AOL"] = nil
    
    // 移除键值对
    if let removeValue = airports.removeValue(forKey: "DUB") {
        
    }
    
    // 键值对遍历
    for (airportCode, airportName) in airports {
        
    }
    
    // 键值遍历
    for airportCode in airports.keys {
        
    }
    
    // 值遍历
    for airportName in airports.values {
        
    }
    
    // 如果我们只是需要某个字典的键集合或者值集合来作为某个接受Array实例的参数，可以直接使用keys或者values属性构造一个新数组
    let airportCodes = [String](airports.keys)
    let airportNames = [String](airports.values)
    
    
}









