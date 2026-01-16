//
//  B_1890_점프.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/16/26.
//

struct B_1890_점프 {
    func solution() {
        let N = Int(readLine()!)!
        let board: [[Int]] = (1...N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! }}
        var dp = [[Int64]](repeating: [Int64](repeating: 0, count: N), count: N)
        
        dp[0][0] = 1
        
        for row in 0..<N {
            for column in 0..<N {
                if board[row][column] == 0 {
                    continue
                }
                
                let nextRow = row + board[row][column]
                let nextColumn = column + board[row][column]
                
                if nextRow < N {
                    dp[nextRow][column] += dp[row][column]
                }
                
                if nextColumn < N {
                    dp[row][nextColumn] += dp[row][column]
                }
            }
        }
        
        print(dp[N-1][N-1])
    }
}
