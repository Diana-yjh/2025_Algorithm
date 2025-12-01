//
//  B_11501_주식.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/24/25.
//
import Foundation

struct B_11501_주식 {
    func solution() {
        let T = Int(readLine()!)!
        
        (1...T).forEach { _ in
            let days = Int(readLine()!)!
            let stocks = readLine()!.split(separator: " ").map{ Int($0)! }
            var maxNum = 0
            var gains: [Int] = []
            var result = 0
            
            for day in stride(from: days-1, to: -1, by: -1) {
                maxNum = max(maxNum, stocks[day])
                
                gains.append(maxNum)
            }
            
            gains.reverse()
            
            for i in 0 ..< days {
                result += gains[i] - stocks[i]
            }
            
            print(result)
        }
    }
}
