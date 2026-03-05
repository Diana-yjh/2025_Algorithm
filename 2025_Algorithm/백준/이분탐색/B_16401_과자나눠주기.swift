//
//  B_16401_과자나눠주기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 3/4/26.
//

import Foundation

struct B_16401_과자나눠주기 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let nephew = input[0]
        let snacks = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var left = 1
        var right = snacks.max()!
        
        if snacks.reduce(0, +) < nephew {
            print(0)
            return
        }
        
        while left < right {
            let middle = (right + left + 1) / 2
            
            var count = 0
            
            for s in snacks {
                count += s / middle
            }
            
            if count >= nephew {
                left = middle
            } else {
                right = middle - 1
            }
        }
        
        print(left)
    }
}
