//
//  B_14002_가장긴증가하는부분수열4.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/5/26.
//

import Foundation

struct B_14002_가장긴증가하는부분수열4 {
    func solution() {
        let number = Int(readLine()!)!
        let sequence = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var dp: [Int] = [Int](repeating: 1, count: number)
        var prev: [Int] = [Int](repeating: -1, count: number)
        
        for i in 0..<sequence.count {
            for j in 0..<i {
                if sequence[j] < sequence[i] && dp[j] + 1 > dp[i] {
                    dp[i] = dp[j] + 1
                    prev[i] = j
                }
            }
        }
        
        var index = dp.firstIndex(of: dp.max()!)
        var array: [Int] = []
        
        while index != -1 {
            array.append(sequence[index!])
            index = prev[index!]
        }
        
        let reversed = array.reversed()
        
        print(dp.max()!)
        reversed.forEach { item in
            print(item, terminator: " ")
        }
    }
}
