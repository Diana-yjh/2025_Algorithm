//
//  B_2512_예산.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/9/25.
//

struct B_2512_예산 {
    func solution() {
        let n = Int(readLine()!)!
        let budgets = readLine()!.split(separator: " ").map { Int($0)! }
        let totalLimit = Int(readLine()!)!
        
        if budgets.reduce(0, +) > totalLimit {
            binarySearch(budgets: budgets, limit: totalLimit)
        } else {
            print(budgets.max()!)
        }
    }
    
    func binarySearch(budgets: [Int], limit: Int) {
        var left = 0
        var right = limit
        var mid = limit / budgets.count
        
        while left + 1 < right {
            var sum = 0
            
            budgets.forEach { item in
                if item < mid {
                    sum += item
                } else {
                    sum += mid
                }
            }
            
            if sum > limit {
                right = mid
                mid = (left + right) / 2
            } else {
                left = mid
                mid = (left + right) / 2
            }
        }
        
        print(mid)
    }
}
