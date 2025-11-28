//
//  B_7576_토마토.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/25/25.
//

struct B_7576_토마토 {
    func solution() {
        let directionX = [1, 0, -1, 0]
        let directionY = [0, 1, 0, -1]
        
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let M = input[0], N = input[1]
        
        var routes: [[Int]] = (1...N).map { _ in readLine()!.split(separator: " ").map { Int($0)!}}
        
        var startPoints: [[Int]] = []
        
        var result = 0
        
        for i in 0..<routes.count {
            let route = routes[i]
            for j in 0..<route.count {
                if route[j] == 1 {
                    startPoints.append([j, i])
                }
            }
        }
        
        var needToVisit: [[Int]] = startPoints
        
        while !needToVisit.isEmpty {
            let start = needToVisit.removeFirst()
            
            for i in 0...3 {
                let nextX = start[0] + directionX[i]
                let nextY = start[1] + directionY[i]
                
                if 0..<M ~= nextX && 0..<N ~= nextY && routes[nextY][nextX] != -1 && routes[nextY][nextX] == 0 {
                    routes[nextY][nextX] = routes[start[1]][start[0]] + 1
                    needToVisit.append([nextX, nextY])
                }
            }
        }
        
        for i in 0..<N {
            result = max(result, routes[i].max()!)
            
            if routes[i].contains(0) {
                print(-1)
                return
            }
        }
        
        print(result - 1)
    }
}
