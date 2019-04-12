//
//  Strings And Characters.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 2018/8/26.
//  Copyright © 2018 YUCHUAN. All rights reserved.
//

import Foundation

// ----String Literals(字符串)-----
let someString = "Some string literal value"
// 多行字符串，用 """ （三个双引号）包裹
let quotation = """
The White Rabbit put on his spectacles. "Where
            shall I begin,
please your Majesty?" he asked.

"Begin at the beginning," the king said
            gravely, "and go on
till you come to the end; then stop."
"""

// 多行字符串中，如果需要断开字符串要用反斜杠（\）
let softWrappedQuotation = """
The White Rabbit put on his spectacles. "Where
            shall I begin, \
please your Majesty?" he asked.

"Begin at the beginning," the king said
            gravely, "and go on \
till you come to the end; then stop."
"""

// 多行字符串换行，加一个空行即可
let lineBreaks = """

This string starts with a line break.
it alse ends with a line breal

"""

// 字符串前面如果需要空格，需要多添加四个空格，不然会被忽略；第一行字符串的前面空格会被忽略，第二行不会
let linesWithIndentation = """
    This string starts with a line break.
        it alse ends with a line breal
"""

//Special Characters in String Literals(特殊字符串)
// \0  (null character)空字符
// \\  (backslash)反斜杠
// \t  (horizontal tab) 水平制表符
// \n  (line feed)换行符
// \r  (carriage return)回车符
// \"  (double quotation mark)双引号
// \'  (single quotation mark)单引号
// \u{n} Unicode码：n代表Unicode码中为n的字符

// 初始化空字符
var emptyString = ""
var anotherEmptyString = String()
// 检查字符串是否为空
let b = emptyString.isEmpty

// ----String Mutability （字符串可变性）---
var variableString = "Horse"  // 可变字符必须声明为变量，不能是常量
func variableFunc() -> Void {
    variableString += " and carriage"
}

// -----字符串是值类型的（Strings Are Value Types）----
// Swift中的String是值类型的。如果你创建了一个新的String类型的值，当它被传给函数或方法时，
// 或者被赋值给常量或变量时，它将会被复制。在每种情况下，都会创建一个新的复制的副本来传值或赋值，
// 而不是用原始值。有关值类型（Value types）详见Structures and Enumerations Are Value Types。

// Swift的默认复制的String行为确保了你可以直接使用函数或方法的String类型的传参，
// 不用考虑它来自哪里。也确保了你可以不用担心你传出的String值被修改，除非是你自己修改的。

// --- 属性Characters的使用（Working with Characters） ----
// 你可以for循环来访问字符串
func accessFunc() -> Void {
    for character in "Dog" {
        print(character)
    }
}

//你还可以用单个字符的字符串来初始化一个字符类型的常量或变量，还需要用Character来声明类型
let exclamationMark: Character = "!"

// 字符串值还可以通过字符数组来初始化
let catCharacters:[Character] = ["C","a","t","!"," "]
let catString = String(catCharacters)

//----- 连接字符串和字符（Concatenating Strings and Characters） ---
// 连接符号: + , +=, append()方法
let string1 = "hello"
let string2 = "there"
func appendStr() -> Void {
    var welcome = string1 + string2
    welcome += "look"
    
    let exclamationMark:Character = "!"
    welcome.append(exclamationMark)
}
// 注意：不能将一个字符串或者一个字符拼接到一个字符变量中，因为一个字符只能包含一个单个的字符

// ----字符串插值（String Interpolation）----
// 字符串插值是一种通过将字面值为字符串的常量、变量、字面量和表达式混合构造新的字符串的方式。
// 其中插入字符串中的每一项需要用圆括号括起来，并在前面加一个反斜杠
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier)*2.5)"
// 上面例子中占位符\(multiplier)会被multiplier的值替代

// ---- Unicode ----
// 任意一个Unicode标量写作：\u{n}，其中n是一个1-8位的十六进制的数
let eAcute: Character = "\u{E9}" // é
let combinedEAcute: Character = "\u{65}\u{301}" // e followed by

// --- 字符计数（Counting Characters） ---
// 使用String的属性characters的属性count可以检索到String中的character的个数。
let unusualMenagerie = "Koala , Snail , Penguin , Dromedary "
func countChar() -> Void {
    print("unusualMenagerie has \(unusualMenagerie.count) characters")
}
// 注意，由于Swift可以使用扩展字符集来表示字符值，意味着字符串的拼接或修改可能不会改变字符串的字符数量。
var word = "cafe" // 四个
func countChar1() -> Void {
    word += "\u{301}" // 还是四个
}

// 扩展字符集由一个或多个Unicode标量组成，这将意味着不同的字符和相同字符的不同表现需要不同的
// 内存来存储。正因为如此，Swift中的字符不是每个都占用相同的内存。因此，如果没有通过遍历字符串
// 来确定扩展字符集，就不能计算出字符串的字符个数。如果你使用了一个特别长的字符串，要想拿到属性
// characters，你需要遍历整个字符串的Unicode标量来确定字符串中的字符。

// string的characters的count属性与NSString的length属性并不总是相同的，即使它们包含相同
// 的字符。NSString的length是基于在UTF-16表示中的16位代码单元数量，而不是字符串中的
// Unicode扩展字符集的数量。

// ----- 访问和修改字符串（Accessing and Modifying a String） -----
// 可以通过String的方法、属性或下标语法来访问和修改字符串
// ----字符串索引（String Indices）：----
// 每个字符串值都有一个相关的索引类型（String.Index），它对应于字符串中每个字符的位置。
// 正如上面提到的，不同的字符需要不同的内存来存储，所以为了确定在某个确定位置的字符，你必须
// 遍历（从字符串的开头到结尾）每个Unicode标量。因此，Swift的String无法用整数值来索引字符串。

// 可以使用startIndex属性访问字符串的第一个字符的位置，而endIndex属性是字符串最后一个字符
// 之后的位置，因此，endIndex对于String的下标语法来说不是一个有效值。如果一个String是空的，
// 那它的startIndex和endIndex是相同的。

// 使用方法index(before:)和index(after:)来访问给定Index的前面和后面的索引。使用
// 方法index(_:offsetBy:)来访问距离给定Index更远的索引。

func accessAndModify() -> Void {
    let greeting = "Guten Tag!"
    greeting[greeting.startIndex]
    greeting[greeting.index(before: greeting.endIndex)]
    greeting[greeting.index(after: greeting.startIndex)]
    let index = greeting.index(greeting.startIndex, offsetBy: 7)
    greeting[index]
    // 访问index之外的字符将会引发运行时错误
    greeting[greeting.endIndex]
    greeting.index(after: greeting.endIndex)
    // 可以使用indices属性访问字符串的所有索引的字符
    for index in greeting.indices {
        print(greeting[index])
    }
    // Note:startIndex和endIndex属性以及index(before:)、index(after:)和
    // index(_:offsetBy:)方法可以用于任何遵循Indexable协议的类型，包括String、
    // 集合Array、Dictionary和Set。
    
    // -----插入和删除（Inserting and Removing）----
    // 向字符串中某个位置插入一个字符使用方法：insert(_:at:)；向字符串中某个位置插入其他字符串
    // 中的内容使用方法：insert(contentsOf:at:)。
    var welcome = "hello"
    welcome.insert("!", at: welcome.endIndex)
    var constentsOf = "is"
    welcome.insert(contentsOf: "there", at: welcome.index(before: welcome.endIndex))
    // 删除一个字符串中某个位置的字符使用方法：remove(at:)；删除字符串中的某个子字符串使用
    // 方法：removeSubrange(_:)。
    welcome.remove(at: welcome.index(before: welcome.endIndex))
    let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
    welcome.removeSubrange(range)
    // Note:insert(_:at:)、insert(contentsOf:at:)、remove(at:)和removeSubrange(_:)
    // 方法可以用于任何遵循协议RangeReplaceableIndexable的类型，包括String，集合Array、Dictionary、Set。
    
    // ------Substrings----
    // 当你从一个字符串获取一个片段的时候，例如：用下标或者一个方法类似prefix(_:)，返回结果就是
    // Substring的一个实例，而不是另外一个字符串。在Swift语言种，Substring和string拥有大多数
    // 相同的方法，这意味着你可以按照string的操作方式来使用Substring。然而，不同的是，当表现string
    // 行为的时候，你只能使用Substring很短的时间。当你想要存储更长的时间时，你需要把Substring转换成String实例
    let greeting2 = "hello, world!"
    let index2  = greeting2.index(of: ".") ?? greeting2.endIndex
    let beginning = greeting2[..<index2]
    
    // convert the result to a String for long-term storage
    let newString = String(beginning)
    // substring 一个神奇的地方是他们重用了父 string 的内存。你可以把 substring 理解为父
    // string 的其中一段。
    
    
    // -----字符串的比较（Comparing Strings）----
    // 字符串和字符相等
    // 字符串和字符用比较操作符中的等号（==）和不等号（!=）来检查是否相等
    let quotation = "We're a lot alike, you and I."
    let sameQuotation = "We're a lot alike, you and I."
    if quotation == sameQuotation {
        print("They are equal")
    }
    
    // 如果两个字符串（或两个字符）的扩展字符集相等，则字符串相等。如果扩展字符集有相同的语言
    // 意义和外观，即使它们由不同的Unicode标量构成，则扩展字符集相等。
    
    // 例如，LATIN SMALL LETTER E WITH ACUTE (U+00E9)和LATIN SMALL LETTER E (U+0065)
    // 后接COMBINING ACUTE ACCENT (U+0301)是正则等价的。这两个扩展字符集都是用来代表字符é的，
    // 所以它们是相等的。
    // 相反地，英语中的拉丁大写字母A和俄语中的斯拉夫大写字母A是不相等的，它们看起来很相似，但在语言意义上并不相同
    
    // ---- 前缀和后缀相等 -----
    // 判断一个字符串是否包含某个字符串的前缀或后缀，使用字符串的方法hasPrefix(_:)和hasSuffix(_:)，
    // 这两个方法都有一个String类型的参数，并返回一个布尔值。
    let romeoAndJuliet = [
        
        "Act 1 Scene 1: Verona, A public place",
                              
        "Act 1 Scene 2: Capulet's mansion",
                                                    
        "Act 1 Scene 3: A room in Capulet's mansion",
        "Act 1 Scene 4: A street outside Capulet's mansion",
                                                                                                
        "Act 1 Scene 5: The Great Hall in Capulet's mansion",
                                                                                                                      
        "Act 2 Scene 1: Outside Capulet's mansion",
                                                                                                                                            
        "Act 2 Scene 2: Capulet's orchard",
                                                                                                                                                                  
        "Act 2 Scene 3: Outside Friar Lawrence's cell",
                                                                                                                                                                                        
        "Act 2 Scene 4: A street in Verona",
                                                                                                                                                                                                              
        "Act 2 Scene 5: Capulet's mansion",
                                                                                                                                                                                                                                    
        "Act 2 Scene 6: Friar Lawrence's cell"
        
    ]
    
    // 你可以用hasPrefix(_:)方法统计数组remeoAndJuliet中的第一幕的位置数
    var act1SceneCount = 0
    for scene in romeoAndJuliet {
        if scene.hasPrefix("Act 1 ") {
            act1SceneCount += 1
        }
    }
    
    // 同样，你可以用hasSuffix(_:)方法统计发生在Capulet’s mansion和Friar Lawrence’s cell的场景数量：
    var mansionCount = 0
    var cellCount = 0
    for scene in romeoAndJuliet {
        if scene.hasSuffix("Capulet's mansion") {
            mansionCount += 1
        } else if scene.hasSuffix("Firar Lawrence's cell") {
            cellCount += 1
        }
    }
    
    // Unicode
    // UTF-8
    let dogString = "Dog!"
    for codeUnit in dogString.utf8 {
        print("\(codeUnit) ", terminator: "")
    }
    
    // UTF-16
    for codeUnit in dogString.utf16 {
        
    }
    
    // UnicodeScalar
    for scalar in dogString.unicodeScalars {
        
    }
    
}







