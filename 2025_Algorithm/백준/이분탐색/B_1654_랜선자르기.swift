//
//  B_1654_랜선자르기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/10/25.
//

import Foundation

struct B_1654_랜선자르기 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let K = input.first!, N = input.last!
        let cables: [Int] = (1...K).map{ _ in Int(readLine()!)!}
        
        let start = cables.max()!
        
        binarySearch(mid: start + 1 / 2, left: 0, right: start)
        
        func binarySearch(mid: Int, left: Int, right: Int) {
            var number = 0
            
            cables.forEach{ item in number += (item / mid) }
            
            if number < N {
                binarySearch(mid: (left + mid) / 2, left: left, right: mid)
            } else {
                if mid == left || mid == right {
                    print(mid)
                    return
                }
                binarySearch(mid: (right + mid) / 2, left: mid, right: right)
            }
        }
    }
}
