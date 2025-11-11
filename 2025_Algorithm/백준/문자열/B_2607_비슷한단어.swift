//
//  B_2607_비슷한단어.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/10/25.
//

import Foundation

struct B_2607_비슷한단어 {
    func solution() {
        let number = Int(readLine()!)!
        let first = readLine()!
        var result = 0
        
        for _ in 0 ..< (number - 1) {
            let word = readLine()!
            var wordCopy = word.sorted()
            var firstCopy = first.sorted()
            
            first.forEach { item in
                if wordCopy.contains(item) {
                    let firstIndex = firstCopy.firstIndex(of: item) ?? 0
                    firstCopy.remove(at: firstIndex)
                    
                    let wordIndex = wordCopy.firstIndex(of: item) ?? 0
                    wordCopy.remove(at: wordIndex)
                }
            }
            
            if firstCopy.count + wordCopy.count <= 1 {
                result += 1
            }
            
            if first.count == word.count && firstCopy.count + wordCopy.count == 2 {
                result += 1
            }
        }
        print(result)
    }
}
