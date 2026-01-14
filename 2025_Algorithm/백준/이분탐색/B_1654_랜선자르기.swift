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
        
        binarySearch(left: 0, right: start)
        
        func binarySearch(left: Int, right: Int) {
            let mid = (left + right) / 2
            var number = 0
            
            if left > right {
                print(mid)
                return
            }
            
            cables.forEach{ item in number += (item / mid) }
            
            if number < N {
                binarySearch(left: left, right: mid - 1)
            } else {
                binarySearch(left: mid + 1, right: right)
            }
        }
    }
}
