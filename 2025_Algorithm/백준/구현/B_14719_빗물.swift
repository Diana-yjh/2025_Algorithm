//
//  B_14719_빗물.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/12/25.
//


/*
 xoxoooo
 xoxooox
 xxxooxx 를 각각의 array로 분리 하여 계산
 
 -> xxxooxx -> 2  -> 정답: 7
    xoxooox -> 4
    xoxoooo -> 1
 */

struct B_14719_빗물 {
    // 시간 복잡도 O(n^3)
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! } // H, W
        let heights = readLine()!.split(separator: " ").map { Int($0)! }
        
        var twoDimArray: [[Int]] = [[Int]](repeating: [Int](repeating: 0, count: input[1]), count: input[0])
        var result = 0
        
        for i in 0 ..< input[0] {
            for j in 0 ..< input[1] {
                if heights[j] >= i + 1 {
                    twoDimArray[i][j] = 1
                }
            }
        }
        
        twoDimArray.forEach { array in
            var area = 0
            
            for a in 0 ..< array.count {
                if array[a] == 0 {
                    if a > 0 && array[0..<a].contains(1) {
                        area += 1
                    }
                } else {
                    result += area
                    area = 0
                }
            }
        }
        print(result)
    }
    
    // 시간복잡도 O(n)
    // 6 12
    // 3 1 5 2 0 0 4 2 3 5 2 1
    func solution2() {
        let HW = readLine()!.split(separator: " ").map { Int($0)! }
        let H = HW[0], W = HW[1]
        let heights = readLine()!.split(separator: " ").map { Int($0)! }

        var leftMax = [Int](repeating: 0, count: W)
        var rightMax = [Int](repeating: 0, count: W)

        var maxL = 0
        for i in 0..<W {
            maxL = max(maxL, heights[i]) // [3 3 5 5 5 5 5 5 5 5 5 5]
            leftMax[i] = maxL
        }

        var maxR = 0
        for i in stride(from: W-1, through: 0, by: -1) {
            maxR = max(maxR, heights[i]) // [5 5 5 5 5 5 5 5 5 5 2 1]
            rightMax[i] = maxR
        }

        var result = 0
        for i in 0..<W {
            let waterLevel = min(leftMax[i], rightMax[i]) // [3 3 5 5 5 5 5 5 5 5 2 1]
            if waterLevel > heights[i] {
                result += waterLevel - heights[i]
            }
        }

        print(result)
    }
}
