//
//  B_2292_벌집.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/9/25.
//

struct B_2292_벌집 {
    func solution() {
        let input = Int(readLine()!)!
        var stageMax = 1
        var answer = 1
        
        while true {
            if input > stageMax {
                stageMax += answer * 6
                answer += 1
            } else {
                print(answer)
                break
            }
        }
    }
}
