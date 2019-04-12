//
//  Swift006_ErrorHanding.swift
//  SwiftStudyEveryDay
//
//  Created by YUCHUAN on 20/07/2017.
//  Copyright © 2017 YUCHUAN. All rights reserved.
//
//  Error Handing

import Foundation

// 使用采用Error协议的类型来表示错误
enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}
// 使用throw来抛出一个错误并且使用throws来表示一个可以抛出错误的函数。如果函数中抛出一个错误，这个函数会立马返回并且调用该函数的代码会进行错误处理。
class ErrorHanding {
    func send(job: Int, toPrinter printerName: String) throws -> String{
        if printerName == "Never Has Toner"{
            throw PrinterError.noToner
        }
        return "Job send"
    }
    
    func func1() -> Void {
        do {
            let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
            print(printerResponse)
            
        } catch {
            print(error)
        }
    }
    
    // 多个catch事件
    func func2() {
        do {
            let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
            print(printerResponse)
        } catch PrinterError.onFire {
            print("I'll just put this over here, with the rest of the fire.")
        } catch let printerError as PrinterError {
            print("Printer error:  \(printerError)")
        } catch {
            print(error)
        }
    }
    
    // 另一种处理错误的方式使用try?将结果转换为可选的。如果函数抛出错误，该错误会被抛弃并且结果为nil。否则的话，结果会是一个包含函数返回值的可选值。
    func func3() {
        let printerSuccess = try? send(job: 1884, toPrinter: "Merger")
        let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")
        print(printerSuccess)
        print(printerFailure)
    }
    
    // 使用defer代码块来表示函数返回前，函数中最后执行的代码。无论函数是否会抛出错误，这段代码都将执行。使用defer，可以把函数调用之初就要执行的代码和函数调用结束时的扫尾代码写在一起，虽然这两者的执行实际截然不同。
    var fridgeIsOpen = false
    let fridgeContent = ["milk", "eggs", "leftovers"]
    func fridgeContain(_ food: String) -> Bool {
        fridgeIsOpen = true
        defer {
            fridgeIsOpen = false
        }
        let result = fridgeContent.contains(food)
        return result
    }
    
    func func4() -> Void {
        fridgeContain("banana")
        print(fridgeIsOpen)
    }
}


