//
//  B_2668_숫자고르기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/17/25.
//

import Foundation

struct B_2668_숫자고르기 {
    func solution() {
        let N = Int(readLine()!)!
        let numbers: [Int] = (1...N).map { _ in readLine()! }.map{ Int($0)! }
        
        var starts: [Int] = []
        var ends: [Int] = []
        var visited: [Int] = []
        
        (1...N).forEach { index in
            starts.append(index)
            ends.append(numbers[index - 1])
            
            while true {
                if starts.sorted() == ends.sorted() {
                    visited.append(contentsOf: starts)
                    starts = []
                    ends = []
                    break
                }
                
                if ends.count != Set(ends).count {
                    starts = []
                    ends = []
                    break
                }
                
                starts.append(ends.last!)
                ends.append(numbers[starts.last! - 1])
            }
        }
        
        print(Set(visited).count)
        Array(Set(visited)).sorted().forEach { print($0) }
    }
}
