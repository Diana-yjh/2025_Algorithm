//
//  B_1260_DFS와BFS.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/14/25.
//

struct B_1260_DFS와BFS {
    func solution() {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        let N = input[0], M = input[1], V = input[2] // 정점의 개수, 간선의 개수, 탐색 시작점
        
        var array: [Int: [Int]] = (1...N).reduce(into: [Int: [Int]]()) { result, key in
            result[key] = []
        }
        
        var sortedReversed: [Int: [Int]] = (1...N).reduce(into: [Int: [Int]]()) { result, key in
            result[key] = []
        }
        
        var sorted: [Int: [Int]] = (1...N).reduce(into: [Int: [Int]]()) { result, key in
            result[key] = []
        }
        
        for _ in 1 ... M {
            let vertex = readLine()!.split(separator: " ").map { Int($0)! }
            let startNode = vertex[0], endNode = vertex[1]
            
            array[startNode, default: []].append(endNode)
            array[endNode, default: []].append(startNode)
        }
        
        for i in 1 ... N {
            sortedReversed[i] = (array[i] ?? []).sorted(by: >)
            sorted[i] = (array[i] ?? []).sorted(by: <)
        }
        
        DFS(array: sortedReversed, nodeNumber: N, startNode: V)
        print("")
        BFS(array: sorted, nodeNumber: N, startNode: V)
    }
    
    // 깊이 우선 탐색
    func DFS(array: [Int: [Int]], nodeNumber: Int, startNode: Int) {
        var visited: [Int] = [] // Queue
        var need: [Int] = [startNode] // Stack
        
        while !need.isEmpty {
            let node = need.removeLast()
            if visited.contains(node) { continue }
            
            visited.append(node)
            need += array[node] ?? []
        }
        
        visited.forEach { print($0, terminator: " ") }
    }
    
    // 너비 우선 탐색
    func BFS(array: [Int: [Int]], nodeNumber: Int, startNode: Int) {
        var visited: [Int] = [] // Queue
        var need: [Int] = [startNode] // Queue
        
        while !need.isEmpty {
            let node = need.removeFirst()
            if visited.contains(node) { continue }
            
            visited.append(node)
            need += array[node] ?? []
        }
        
        visited.forEach { print($0, terminator: " ") }
    }
}
