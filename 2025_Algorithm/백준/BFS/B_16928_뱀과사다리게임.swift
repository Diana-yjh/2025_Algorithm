//
//  B_16928_뱀과사다리게임.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/22/25.
//

struct B_16928_뱀과사다리게임 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let N = input[0], M = input[1]
        
        let laddersAndSnakes: [[Int]] = (1...(N + M)).map{ _ in readLine()!.split(separator: " ").map{ Int($0)!} }
        
        bfs(laddersAndSnakes: laddersAndSnakes)
    }
    
    func bfs(laddersAndSnakes: [[Int]]) {
        var nextNumber = (1, 0)
        var needToVisit: [(Int, Int)] = [nextNumber]
        var visited: [Int] = []
        
        while !needToVisit.isEmpty {
            let first = needToVisit.removeFirst()
            
            if first.0 == 100 {
                print(first.1)
                break
            }
            
            if visited.contains(first.0) {
                continue
            }
            
            visited.append(first.0)
            
            (1...6).forEach { diceNumber in
                nextNumber = (first.0 + diceNumber, first.1 + 1)
                
                let index = laddersAndSnakes.firstIndex { item in item.first == nextNumber.0 }
                
                if index != nil {
                    let detination = laddersAndSnakes[Int(index!)].last
                    nextNumber.0 = detination!
                }
                
                needToVisit.append((nextNumber.0, nextNumber.1))
            }
        }
    }
}
