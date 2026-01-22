//
//  B_20437_문자열게임.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/14/26.
//

import Foundation

struct B_20437_문자열게임 {
    func solution() {
        let T = Int(readLine()!)!
        
        (1...T).forEach { _ in
            let input = readLine()!
            var W: [String] = []
            
            for w in input {
                W.append(String(w))
            }
            
            let K = Int(readLine()!)!
            
            var visited : [String] = []
            var minNum = W.count
            var maxNum = 0
            
            for i in 0..<W.count {
                let alpha: String = W[i]
                var indexes: [Int] = []
                
                if !visited.contains(alpha) {
                    visited.append(alpha)
                    
                    for j in 0..<W.count {
                        if alpha == W[j] {
                            indexes.append(j)
                        }
                    }
                }
                
                if indexes.count >= K {
                    for i in 0..<indexes.count - (K - 1) {
                        minNum = min(minNum, indexes[i+(K - 1)] - indexes[i])
                        maxNum = max(maxNum, indexes[i+(K - 1)] - indexes[i])
                    }
                }
            }
            
            if minNum == W.count || maxNum == 0 {
                print(-1)
            } else {
                print("\(minNum + 1) \(maxNum + 1)")
            }
        }
    }
}
