//
//  B_16897_계란으로계란치기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/13/26.
//

import Foundation

struct B_16897_계란으로계란치기 {
    func solution() {
        let number = Int(readLine()!)!
        var eggs: [(Int, Int)] = []
        var maxCrash = 0
        
        (0..<number).forEach { _ in
            let input = readLine()!.split(separator: " ").map { Int($0)! }
            eggs.append((input[0], input[1]))
        }
        
        func backTracking(index: Int, remain: [(Int, Int)]) {
            if index == number {
                maxCrash = max(maxCrash, remain.filter { $0.0 <= 0 }.count)
                return
            }
            
            if remain[index].0 < 0 {
                backTracking(index: index + 1, remain: remain)
                return
            }
            
            for i in 0..<number {
                var r = remain
                
                if index != i {
                    if remain[i].0 <= 0 {
                        backTracking(index: index + 1, remain: remain)
                    } else {
                        r[i].0 = r[i].0 - r[index].1
                        r[index].0 = r[index].0 - r[i].1
                        
                        backTracking(index: index + 1, remain: r)
                    }
                }
            }
        }
        
        backTracking(index: 0, remain: eggs)
        
        print(maxCrash)
    }
}
