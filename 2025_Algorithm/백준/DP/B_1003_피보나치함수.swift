//
//  B_1003_피보나치함수.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/2/25.
//

import Foundation

struct B_1003_피보나치함수 {
    func solution() {
        let T = Int(readLine()!)!
        
        var testCases = [Int]()
        
        for _ in 0..<T {
            testCases.append(Int(readLine()!)!)
        }
        
        var array = [(Int, Int)](repeating: (0, 0), count: 41)
        
        func dp(_ n: Int) -> (Int, Int) {
            if n == 0 {
                array[0].0 = 1
                return (1, 0)
            } else if n == 1 {
                array[1].1 = 1
                return (0, 1)
            } else {
                if array[n].0 == 0 && array[n].1 == 0 {
                    let a = dp(n - 1)
                    let b = dp(n - 2)
                    array[n] = (a.0 + b.0, a.1 + b.1)
                }
                return array[n]
            }
        }
        
        for n in testCases {
            let result = dp(n)
            print(result.0, result.1)
        }
    }
}
