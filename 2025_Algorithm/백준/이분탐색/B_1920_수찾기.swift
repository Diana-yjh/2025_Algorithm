//
//  B_1920_수찾기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 3/5/26.
//

struct B_1920_수찾기 {
    func solution() {
        let n = Int(readLine()!)
        var firstInput = readLine()!.split(separator: " ").map{ Int($0)! }
        
        let m = Int(readLine()!)
        var secondInput = readLine()!.split(separator: " ").map{ Int($0)! }
        
        let set = Set(firstInput)
        
        for s in secondInput {
            print(set.contains(s) ? 1 : 0)
        }
    }
}
