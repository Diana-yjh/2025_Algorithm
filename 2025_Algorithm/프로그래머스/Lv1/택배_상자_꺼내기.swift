//
//  택배_상자_꺼내기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/8/26.
//

import Foundation

func solution(_ n:Int, _ w:Int, _ num:Int) -> Int {
    var result: Int = 0
    let height = n % w == 0 ? n / w : n / w + 1
    var array: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: w), count: height)
    
    for h in 0..<height {
        for i in 0..<w {
            
            array[h][i] = h * w + i + 1 > n ? 0 : h * w + i + 1
        }
        
        if h % 2 != 0 {
            array[h].reverse()
        }
    }
    
    var targetIndex = 0
    var targetHeight = 0
    
    for h in 0..<height {
        if array[h].contains(num) {
            targetIndex = array[h].firstIndex(of: num) ?? 0
            targetHeight = h
            break
        }
    }
    
    for i in targetHeight..<height {
        if array[i][targetIndex] != 0 {
            result += 1
        }
    }
    
    return result
}
