//
//  B_2295_세수의합.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/14/26.
//

import Foundation

struct B_2295_세수의합 {
    func solution() {
        let n = Int(readLine()!)!
        var u: [Int] = (1...n).map{ _ in Int(readLine()!)! }
        
        u.sort(by: >)
        
        for a in 0..<u.count {
            for i in a+1..<u.count {
                var left = i
                var right = u.count - 1
                
                while left <= right {
                    if u[left] + u[right] < u[a] - u[i] {
                        right -= 1
                    } else if u[left] + u[right] > u[a] - u[i] {
                        left += 1
                    } else {
                        print(u[a])
                        return
                    }
                }
            }
        }
    }
}
