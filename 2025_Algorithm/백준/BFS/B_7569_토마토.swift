//
//  B_7569_토마토.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/1/25.
//

struct B_7569_토마토 {
    let directionX: [Int] = [1, 0, -1, 0, 0, 0]
    let directionY: [Int] = [0, -1, 0, 1, 0, 0]
    let directionH: [Int] = [0, 0, 0, 0, 1, -1]
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let M = input[0], N = input[1], H = input[2]
        var tomatos: [[[Int]]] = [[[Int]]](repeating: [[Int]](repeating: [], count: N), count: H)
        var needToVisit: Queue<(Int, Int, Int, Int)> = Queue()
        var day = 0
        
        for h in 0 ..< H {
            for n in 0 ..< N {
                let column = readLine()!.split(separator: " ").map{ Int($0)! }
                
                for m in 0 ..< column.count {
                    tomatos[h][n].append(column[m])
                    
                    if column[m] == 1 {
                        needToVisit.enqueue((m, n, h, 0))
                    }
                }
            }
        }
        
        while !needToVisit.isEmpty {
            let item = needToVisit.dequeue() ?? (0, 0, 0, 0)
            
            for i in 0 ..< 6 {
                let nextM = item.0 + directionX[i]
                let nextN = item.1 + directionY[i]
                let nextH = item.2 + directionH[i]
                let distance = item.3
                
                if !((0..<H) ~= nextH) || !((0..<N) ~= nextN) || !((0..<M) ~= nextM) {
                    continue
                }
                
                if tomatos[nextH][nextN][nextM] != -1 && tomatos[nextH][nextN][nextM] != 1 {
                    tomatos[nextH][nextN][nextM] = 1
                    needToVisit.enqueue((nextM, nextN, nextH, distance + 1))
                    day = max(day, distance + 1)
                }
            }
        }
        
        for h in 0..<H {
            for n in 0..<N {
                for m in 0..<M {
                    if tomatos[h][n][m] == 0 {
                        print(-1)
                        return
                    }
                }
            }
        }
        
        print(day)
    }
}
