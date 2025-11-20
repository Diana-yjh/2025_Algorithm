//
//  B_2075_N번째큰수.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/20/25.
//
// 해결 못함

import Foundation

struct B_2075_N번째큰수 {
    // 시간 초과
    func solutionX() {
        let N = Int(readLine()!)!
        var queue: [Int] = []
        
        (1...N).forEach { _ in readLine()!.split(separator: " ").map { Int($0)! }.forEach { queue.append($0) } }
        
        queue.sort(by: >)
        
        print(queue[N - 1])
    }
    
    func solutionX2() {
        let data = FileHandle.standardInput.readDataToEndOfFile()
        let str = String(data: data, encoding: .utf8) ?? ""
        var parts: [Int] = str.split{ $0 == " " || $0 == "\n"}.map{ Int($0)! }
       
        let N = parts.removeFirst()
        
        parts.sort(by: >)
        
        print(parts[N - 1])
    }
}
