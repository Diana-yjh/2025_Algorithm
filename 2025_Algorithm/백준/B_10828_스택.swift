//
//  B_10828_스택.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 4/10/26.
//

import Foundation

struct B_10828_스택 {
    var stack: [Int] = []
    var result: Int = 0
    
    mutating func solution() {
        let input = Int(readLine()!)!
        
        for _ in 0..<input {
            let command = readLine()!.split(separator: " ")
            
            switch command.first {
            case "pop":
                result = stack.popLast() ?? -1
            case "top":
                result = stack.last ?? -1
            case "push":
                stack.append(Int(command[1])!)
            case "size":
                result = stack.count
            case "empty":
                result = stack.isEmpty ? 1 : 0
            default:
                print("default")
            }
            print(result)
        }
    }
}
