//
//  B_10845_큐.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 4/13/26.
//

import Foundation

struct B_10845_큐 {
//    func solution() {
//        let n = Int(readLine()!)!
//        var inputQueue: [Int] = []
//        var outputQueue: [Int]  = []
//        var result: String = ""
//        
//        func pop() -> Int {
//            if inputQueue.isEmpty && outputQueue.isEmpty {
//                return -1
//            }
//            
//            if outputQueue.isEmpty && !inputQueue.isEmpty {
//                outputQueue += inputQueue.reversed()
//            }
//            
//            return outputQueue.removeLast()
//        }
//        
//        func front() -> Int {
//            if inputQueue.isEmpty && outputQueue.isEmpty {
//                return -1
//            }
//            
//            if !outputQueue.isEmpty && inputQueue.isEmpty {
//                return outputQueue.last ?? -1
//            }
//            
//            return inputQueue[0]
//        }
//        
//        func back() -> Int {
//            if inputQueue.isEmpty && outputQueue.isEmpty {
//                return -1
//            }
//            
//            if !outputQueue.isEmpty && inputQueue.isEmpty {
//                return outputQueue[0]
//            }
//            
//            return inputQueue.last ?? -1
//        }
//        
//        (0..<n).forEach { _ in
//            let input = readLine()!.split(separator: " ")
//            
//            switch input[0] {
//            case "push":
//                inputQueue.append(Int(input[1])!)
//            case "pop":
//                result += "\(pop())\n"
//            case "size":
//                result += "\(inputQueue.count + outputQueue.count)\n"
//            case "empty":
//                result += "\(inputQueue.isEmpty && outputQueue.isEmpty ? 1 : 0)\n"
//            case "front":
//                result += "\(front())\n"
//            case "back":
//                result += "\(back())\n"
//            default: break
//            }
//        }
//        
//        print(result)
//    }
    
    func solution() {
        
    }
}
