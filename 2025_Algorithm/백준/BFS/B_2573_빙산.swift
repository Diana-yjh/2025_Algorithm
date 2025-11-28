//
//  B_2573_빙산.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/28/25.
//

struct Queue<T> {
    private var inbound = [T]()
    private var outbound = [T]()
    
    var isEmpty: Bool {
        return inbound.isEmpty && outbound.isEmpty
    }
    
    var count: Int {
        return inbound.count + outbound.count
    }
    
    mutating func enqueue(_ element: T) {
        inbound.append(element)
    }
    
    mutating func dequeue() -> T? {
        if outbound.isEmpty {
            outbound = inbound.reversed()
            inbound.removeAll()
        }
        return outbound.popLast()
    }
}

struct B_2573_빙산 {
    let directionX = [1, 0, -1, 0]
    let directionY = [0, -1, 0, 1]
    
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let N = input[0], M = input[1]
        
        var maps: [[Int]] = (1...N).map{ _ in readLine()!.split(separator: " ").map{ Int($0)! }}
        
        var year = 0
        
        while true {
            var visited = Array(repeating: Array(repeating: false, count: M), count: N)
            var melt = Array(repeating: Array(repeating: 0, count: M), count: N)
            var numberOfIsland = 0
            
            for i in 0..<N {
                for j in 0..<M {
                    if maps[i][j] > 0 && !visited[i][j] {
                        numberOfIsland += 1
                        
                        if numberOfIsland >= 2 {
                            print(year)
                            return
                        }
                        
                        var queue = Queue<(Int, Int)>()
                        queue.enqueue((i, j))
                        
                        visited[i][j] = true
                        
                        while !queue.isEmpty {
                            guard let (x, y) = queue.dequeue() else { break }
                            
                            for d in 0...3 {
                                let nx = x + directionX[d]
                                let ny = y + directionY[d]
                                
                                if !((0..<N) ~= nx) || !((0..<M) ~= ny) {
                                    continue
                                }
                                
                                if maps[nx][ny] > 0 && !visited[nx][ny] {
                                    visited[nx][ny] = true
                                    queue.enqueue((nx, ny))
                                }
                                
                                if maps[nx][ny] == 0 {
                                    melt[x][y] += 1
                                }
                            }
                        }
                    }
                }
            }
            
            if numberOfIsland == 0 {
                print(0)
                return
            }
            
            for i in 0..<N {
                for j in 0..<M {
                    if maps[i][j] > 0 {
                        maps[i][j] = max(0, maps[i][j] - melt[i][j])
                    }
                }
            }
            
            year += 1
        }
    }
}
