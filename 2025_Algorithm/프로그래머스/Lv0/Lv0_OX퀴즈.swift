//
//  Lv0_OX퀴즈.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/6/26.
//

import Foundation

//func solution(_ quiz:[String]) -> [String] {
//    var result: [String] = []
//    
//    for f in quiz {
//        let contents = f.split(separator: " ").map { String($0) }
//        let nums = contents.compactMap { Int($0) }
//        
//        if calculate(nums[0], nums[1], contents[1]) == nums.last {
//            result.append("O")
//        } else {
//            result.append("X")
//        }
//    }
//    
//    
//    return result
//}
//
//func calculate(_ num1: Int, _ num2: Int, _ formula: String) -> Int {
//    switch formula {
//    case "+":
//        return num1 + num2
//    case "-":
//        return num1 - num2
//    default:
//        return 0
//    }
//}
