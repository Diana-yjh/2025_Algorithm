//
//  B_10828_스택.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 4/10/26.
//

import Foundation

struct B_10828_스택 {
    var stack: [Int] = []
    var result: String = ""
    
    mutating func solution() {
        let input = Int(readLine()!)!
        
        for _ in 0..<input {
            let command = readLine()!.split(separator: " ")
            
            switch command.first {
            case "pop":
                result = "\(stack.popLast() ?? -1)\n"
            case "top":
                result = "\(stack.last ?? -1)\n"
            case "push":
                stack.append(Int(command[1])!)
            case "size":
                result = "\(stack.count)\n"
            case "empty":
                result = "\(stack.isEmpty ? 1 : 0)\n"
            default: break
            }
        }
        
        print(result)
    }
}
