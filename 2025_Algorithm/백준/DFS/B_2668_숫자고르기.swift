//
//  B_2668_숫자고르기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/17/25.
//

import Foundation

struct B_2668_숫자고르기 {
    func solution() {
        let N: Int = Int(readLine()!)!
        let values: [Int] = (0..<N).map { _ in Int(readLine()!)!}
        
        dfs(indexs: [Int](1...N), values: values)
    }
    
    func dfs(indexs: [Int], values: [Int]) {
        var result: [Int] = []
        
        print(result.count)
        result.forEach { print($0) }
    }
}
