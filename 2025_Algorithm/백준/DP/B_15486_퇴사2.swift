//
//  B_15486_퇴사2.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/3/25.
//

import Foundation

struct B_15486_퇴사2 {
    func solution() {
        let data = FileHandle.standardInput.readDataToEndOfFile()
        let str = String(data: data, encoding: .utf8)!
        let input: [Int] = str.split{ $0 == " " || $0 == "\n"}.map{ Int($0)! }
        
        let N = input.first ?? 0
        var timeTaken = [Int]()
        var revenue = [Int]()
        
        var dp: [Int] = [Int](repeating: 0, count: N + 2)
        
        for i in 1..<input.count {
            if i % 2 != 0 {
                timeTaken.append(input[i])
            } else {
                revenue.append(input[i])
            }
        }
        
        for i in 1...N {
            dp[i + 1] = max(dp[i + 1], dp[i])
            
            let next = i + timeTaken[i - 1]
            
            if next <= N + 1 {
                dp[next] = max(dp[next], dp[i] + revenue[i - 1])
            }
        }
        
        print(dp[N + 1])
    }
}
