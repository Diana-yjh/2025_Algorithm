//
//  B_18869_멀티버스2.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 3/6/26.
//

struct B_18869_멀티버스2 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let u = input[0]
        
        let arrays: [[Int]] = (1...u).map {_ in readLine()!.split(separator: " ").map{ Int($0)! }}
        
        var compressed: [[Int]] = []
        
        for array in arrays {
            let sortedArr = array.sorted()
            
            var dic: [Int: Int] = [:]
            
            for (i, v) in sortedArr.enumerated() {
                if dic[v] == nil { dic[v] = i }
            }
            
            var order: [Int] = []
            
            for i in array {
                order.append(dic[i]!)
            }
            
            compressed.append(order)
        }
        
        var counter: [[Int]: Int] = [:]
        
        for compress in compressed {
            counter[compress, default: 0] += 1
        }
        
        var answer = 0
        
        for c in counter {
            if counter[c.key, default: 0] > 1 {
                answer += c.value * (c.value - 1) / 2 
            }
        }
        
        print(answer)
    }
}
