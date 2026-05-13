//
//  중요한_단어를_스포_방지.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/11/26.
//

import Foundation

func solution(_ message:String, _ spoiler_ranges:[[Int]]) -> Int {
    var words = Array(message)
    var isHidden = [Bool](repeating: false, count: words.count)
    
    for range in spoiler_ranges {
        for r in range[0]...range[1] {
            isHidden[r] = true
        }
    }
    
    print(isHidden)
    return 0
}
