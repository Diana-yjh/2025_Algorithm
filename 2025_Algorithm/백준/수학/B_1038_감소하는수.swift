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
        var arr: [Int] = []
        
        while count <= N {
            if N == 0 { return }
            
            count += 1
            
            guard let first = arr.first, first / 10 < 1 else {
                arr.append(count)
                continue
            }
            
            
        }
    }
}

/*
 0 1 2 3 4 5 6 7 8 9
 10 20 21 30 31 32 40 41 42 43 ...
 210 310 320 321 410 420 421 430 431 432 ...
 
 */
