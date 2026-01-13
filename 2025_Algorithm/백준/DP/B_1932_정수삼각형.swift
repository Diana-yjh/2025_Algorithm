//
//  B_1932_정수삼각형.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/8/25.
//
import Foundation

struct B_1932_정수삼각형 {
    func solution() {
        let height = Int(readLine()!)!
        var graph: [[Int]] = [[Int]](repeating: [], count: height)
        var result: [Int] = [0]

        for i in 0..<height {
            readLine()!
                .split(separator: " ")
                .map { Int($0)! }
                .forEach { item in graph[i].append(item) }
        }
        
        if height == 1 {
            print(graph[0].first!)
            return
        }
        
        dp(1, graph[0])
        
        func dp(_ index: Int, _ before: [Int]) {
            let index = index
            let array = graph[index]
            var newArray: [Int] = []
            
            for i in 0 ..< array.count {
                var maxNum = 0
                
                if i == 0 {
                    maxNum = array[i] + before[i]
                } else if i == array.count - 1 {
                    maxNum = array[i] + before[i - 1]
                } else {
                    maxNum = max(array[i] + before[i], array[i] + before[i - 1])
                }
                
                newArray.append(maxNum)
            }
            
            if index == height - 1 {
                result = newArray
                return
            }
            
            dp(index + 1, newArray)
        }
        
        print(result.max()!)
    }
    
    func solution2() {
        let height = Int(readLine()!)!
        var before: [Int] = [Int](repeating: 0, count: height)
        var copyBefore: [Int] = [Int](repeating: 0, count: height)
        
        for _ in 0..<height {
            let numbers = readLine()!.split(separator: " ").map { Int($0)! }
            
            if numbers.count == 1 {
                before[0] = numbers[0]
            } else {
                var maxNum = 0
                
                for i in 0..<numbers.count {
                    if i == 0 {
                        maxNum = before[i] + numbers[i]
                    } else if i == numbers.count - 1 {
                        maxNum = before[i - 1] + numbers[i]
                    } else {
                        maxNum = max(before[i - 1] + numbers[i], before[i] + numbers[i])
                    }
                    copyBefore[i] = maxNum
                }
                before = copyBefore
            }
        }
        
        print(before.max()!)
    }
}
