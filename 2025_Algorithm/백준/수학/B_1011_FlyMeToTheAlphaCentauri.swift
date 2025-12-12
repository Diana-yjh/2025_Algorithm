//
//  B_1011_FlyMeToTheAlphaCentauri.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/12/25.
//

import Foundation

struct B_1011_FlyMeToTheAlphaCentauri {
    func solution() {
        let testcase = Int(readLine()!)!
        
        for _ in 0 ..< testcase {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let start = input[0], end = input[1]
            let distance: Double = Double(end - start)
            
            let n = sqrt(distance)
            
            if distance == n * n {
                print(2 * n - 1)
            } else if distance <= n * (n + 1) {
                print(2 * n)
            } else {
                print(2 * n + 1)
            }
        }
    }
}
