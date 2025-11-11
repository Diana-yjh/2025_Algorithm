//
//  B_2805_나무자르기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/10/25.
//

import Foundation

struct B_2805_나무자르기 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let height = readLine()!.split(separator: " ").map{ Int($0)! }
        
        binarySearch(height: height, need: input[1])
    }
    
    func binarySearch(height: [Int], need: Int) {
        var left = 0
        var right = height.max() ?? 0
        var mid = right / 2
        
        var sum = 0
        
        while left + 1 < right {
            sum = height.map { $0 - mid }.filter{$0 > 0}.reduce(0, +)
            
            if sum > need {
                left = mid
                mid = (left + right) / 2
            } else if sum < need {
                right = mid
                mid = (left + right) / 2
            } else {
                break
            }
        }
        
        print(mid)
    }
}
