//
//  B_1157_단어공부.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/9/25.
//

import Foundation

struct B_1157_단어공부 {
    func solution() {
        let input = readLine()!.uppercased()
        let characters = Set(input)
        var max = 0
        var answer = ""
        
        for character in characters {
            let count = input.filter { $0 == character }.count
            if max == count {
                answer = "?"
            }
            
            if max < count {
                max = count
                answer = String(character)
            }
        }
        
        print(answer)
    }
}
