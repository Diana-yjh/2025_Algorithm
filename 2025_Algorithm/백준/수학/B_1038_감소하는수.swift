//
//  B_1038_감소하는수.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/14/25.
//

struct B_1038_감소하는수 {
    func solution() {
        let N = Int(readLine()!)!
        var count = 0
        
        for i in 0...10 {
            let start: [Int] = Array(i...9)
            
            x(array: start, length: i)
        }
    }
    
    func x(array: [Int], length: Int) {
        var length = length
        
        for i in array {
            let next = Array(0...i)
            
            if next.count < length {
                continue
            }
            
            if length == 0 {
                
            }
            
            length += 1
        }
    }
}
