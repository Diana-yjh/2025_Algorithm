//
//  B_10816_숫자카드2.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 3/5/26.
//

struct B_10816_숫자카드2 {
    func solution() {
        let n = Int(readLine()!)!
        var firstInput = readLine()!.split(separator: " ").map{ Int($0)! }
        
        let m = Int(readLine()!)!
        var secondInput = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var pointer = 0
        var dic: [Int: Int] = [:]
        
        for f in firstInput {
            dic[f, default: 0] += 1
        }
        
        print(secondInput.map{ String(dic[$0, default: 0]) }.joined(separator: " "))
    }
}

/*
 10
 6 3 2 10 10 10 -10 -10 7 3
 8
 10 9 -5 2 3 4 5 -10
 */
