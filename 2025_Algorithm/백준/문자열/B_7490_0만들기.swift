//
//  B_7490_0만들기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/24/25.
//

import Foundation

struct B_7490_0만들기 {
    
    func solution() {
        let operators = ["+", "-", " "]
        
        let testCase = Int(readLine()!)!
        let N = (1...testCase).map{ _ in Int(readLine()!)!}
        
        N.forEach { i in
            let totalCount = i - 1
            var totalCases = [[String]]()
            
            backTrack([])
            
            find0Case(totalCases: totalCases)
            
            func backTrack(_ current: [String]) {
                if current.count == totalCount {
                    totalCases.append(current)
                    return
                }
                
                operators.forEach { `operator` in
                    backTrack(current + [`operator`])
                }
            }
            print("")
        }
    }
    
    func find0Case(totalCases: [[String]]) {
        var expressions: [String] = []
        
        totalCases.forEach { cases in
            var expression = "1"
            
            for i in 0..<cases.count {
                   switch cases[i] {
                   case "+":
                       expression += "+\(i+2)"
                   case "-":
                       expression += "-\(i+2)"
                   default:
                       expression += " \(i+2)"
                   }
            }
            
            if calculate(expression: expression) == 0 {
                expressions.append(expression)
            }
        }
        
        expressions.sorted().forEach { print($0)}
    }
    
    func calculate(expression: String) -> Int {
        let numbers = expression.filter{ !$0.isWhitespace }.components(separatedBy: ["+", "-"]).map{ Int($0)! }
        let operators = expression.filter{$0 == "+" || $0 == "-"}.map{ $0 }
        var result = numbers.first ?? 0
        
        for i in 0..<operators.count {
            switch operators[i] {
            case "+":
                result += numbers[i + 1]
            case "-":
                result -= numbers[i + 1]
            default:
                print("?")
            }
        }
        
        return result
    }
}
