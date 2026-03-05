//
//  B_3151_합이0.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 3/5/26.
//

import Foundation

struct B_3151_합이0 {
    func solution() {
        let n = Int(readLine()!)
        var input = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var pointer = 0
        var count = 0
        
        input.sort()
        
        while pointer < input.count - 2 {
            var left = pointer + 1
            var right = input.count - 1
            
            while left < right {
                if input[left] + input[right] + input[pointer] < 0 {
                    left += 1
                } else if input[left] + input[right] + input[pointer] > 0 {
                    right -= 1
                } else {
                    if input[left] == input[right] {
                        count += (right - left + 1)*(right - left) / 2
                        break
                    } else {
                        var lCount = 1
                        while input[left] == input[left + lCount] {
                            lCount += 1
                        }
                        
                        var rCount = 1
                        while input[right] == input[right - rCount] {
                            rCount += 1
                        }
                        
                        left += lCount
                        right -= rCount
                        
                        count += lCount * rCount
                    }
                }
            }
            
            pointer += 1
        }
        
        print(count)
    }
}
