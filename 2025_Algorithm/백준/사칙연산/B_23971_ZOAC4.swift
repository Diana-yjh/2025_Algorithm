//
//  23971_ZOAC4.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/9/25.
//

import Foundation

struct B_23971_ZOAC4 {
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let H = input[0]
        let W = input[1]
        let N = input[2]
        let M = input[3]
        
        print(ceil(H, N + 1) * ceil(W, M + 1))
    }
    
    func ceil(_ a: Int, _ b: Int) -> Int {
        if a % b != 0 {
            return a / b + 1
        }
            return a / b
    }
}
