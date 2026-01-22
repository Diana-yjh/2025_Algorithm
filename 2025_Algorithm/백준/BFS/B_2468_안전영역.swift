//
//  B_2468_안전영역.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/22/26.
//

struct B_2468_안전영역 {
    func solution() {
        let N = Int(readLine()!)!
        var maxHeight = 0
        var maxNumber = 0
        
        let xDirection = [1, 0, -1, 0]
        let yDirection = [0, 1, 0, -1]
        
        let height: [[Int]] = (1...N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! }}
        var visited: [[Bool]] = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
        
        
        (0..<N).forEach { index in
            maxHeight = max(maxHeight, height[index].max()!)
        }
        
        for submerged in 0..<maxHeight {
            var numberOfArea = 0
            
            if submerged == 0 {
                maxNumber = 1
                continue
            }
            
            for row in 0..<N {
                for column in 0..<N {
                    if height[row][column] - submerged > 0, !visited[row][column] {
                        numberOfArea += 1
                        
                        bfs(row: row, column: column, submerged: submerged)
                    }
                }
            }
            
            visited = [[Bool]](repeating: [Bool](repeating: false, count: N), count: N)
            maxNumber = max(maxNumber, numberOfArea)
        }
        
        print(maxNumber)
        
        func bfs(row: Int, column: Int, submerged: Int) {
            for index in 0..<4 {
                let nextX = column + xDirection[index]
                let nextY = row + yDirection[index]
                
                if (0..<N) ~= nextX, (0..<N) ~= nextY, height[nextY][nextX] - submerged > 0, !visited[nextY][nextX] {
                    visited[nextY][nextX] = true
                    
                    bfs(row: nextY, column: nextX, submerged: submerged)
                }
            }
        }
    }
}
