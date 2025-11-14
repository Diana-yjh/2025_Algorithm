//
//  B_14940_쉬운최단거리.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/12/25.
//

struct B_14940_쉬운최단거리 {
    func solution() {
        // [0, 1] -> 아래, [1, 0] -> 오른쪽, [0, -1] -> 위, [-1, 0] -> 왼쪽
        let directionX = [0, 1, 0, -1]
        let directionY = [1, 0, -1, 0]
        
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let rows = input[0], columns = input[1]
        var totalRoute = [[Int]](repeating: [], count: rows)
        var visitied = [[Bool]](repeating: [Bool](repeating: false, count: columns), count: rows)
        var startPoint = (0, 0) // row, column
        var remainQueue: [(Int, Int, Int)] = [] // row, column, distance
        var index = 0
        
        for row in 0 ..< rows {
            totalRoute[row] = readLine()!.split(separator: " ").map { Int($0)! }
            
            if totalRoute[row].contains(2) {
                let column = Int(totalRoute[row].firstIndex(of: 2)!)
                startPoint = (row, column)
                
                remainQueue.append((startPoint.0, startPoint.1, 0))
            }
        }
        
        visitied[startPoint.0][startPoint.1] = true
        
        while remainQueue.count > index {
            // 상하좌우 확인
            for i in 0 ..< 4 {
                var nextX = remainQueue[index].0
                var nextY = remainQueue[index].1
                let nextDistance = remainQueue[index].2
                
                if totalRoute[nextX][nextY] == 0 { continue }
                
                nextX += directionX[i]
                nextY += directionY[i]
                
                if 0 ..< rows ~= nextX && 0 ..< columns ~= nextY && totalRoute[nextX][nextY] == 1 && visitied[nextX][nextY] == false {
                    remainQueue.append((nextX, nextY, nextDistance + 1))
                    visitied[nextX][nextY] = true
                } else if 0 ..< rows ~= nextX && 0 ..< columns ~= nextY && totalRoute[nextX][nextY] == 0 && visitied[nextX][nextY] == false {
                    remainQueue.append((nextX, nextY, 0))
                    visitied[nextX][nextY] = true
                }
            }
            index += 1
        }
        
        for i in 0 ..< rows {
            for j in 0 ..< columns {
                if visitied[i][j] == false && totalRoute[i][j] == 1 {
                    totalRoute[i][j] = -1
                }
            }
        }
        
        
        for item in remainQueue {
            totalRoute[item.0][item.1] = item.2
        }
        
        for row in totalRoute {
            row.forEach { print($0, terminator: " ") }
            print("")
        }
    }
}
