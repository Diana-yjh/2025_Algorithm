//
//  B_18870_좌표압축.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 3/4/26.
//

import Foundation

struct B_18870_좌표압축 {
    func solution() {
        let n = Int(readLine()!)!
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        
        let array = Array(Set(input)).sorted()
        
        var rank: [Int: Int] = [:]
        
        for (i, v) in array.enumerated() {
            rank[v] = i
        }
        
        print(input.map { String(rank[$0]!) }.joined(separator: " "))
    }
}
