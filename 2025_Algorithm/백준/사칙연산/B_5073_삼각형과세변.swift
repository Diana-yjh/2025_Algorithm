//
//  B_5073_삼각형과세변.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/9/25.
//

struct B_5073_삼각형과세변 {
    func solution() {
        while true {
            let input = readLine()!.split(separator: " ").map { Int($0)! }

            let sortedInput = input.sorted(by: >)
            
            if sortedInput.last == 0 { return }
            
            if sortedInput[0] >= sortedInput[1] + sortedInput[2] {
                print("Invalid")
            } else if sortedInput.first == sortedInput.last {
                print("Equilateral")
            } else if sortedInput[0] == sortedInput[1] || sortedInput[1] == sortedInput[2] {
                print("Isosceles")
            } else {
                print("Scalene")
            }
        }
    }
}
