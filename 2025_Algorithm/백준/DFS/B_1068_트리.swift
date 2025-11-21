//
//  B_1068_트리.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/21/25.
//

struct B_1068_트리 {
    func solution() {
        let N = Int(readLine()!)!
        let parentNodes = readLine()!.split(separator: " ").map{ Int($0)! }
        let toDelete = Int(readLine()!)!
        var twoDimArray = [[Int]](repeating: [], count: N)
        var count = 0
        
        for i in 0..<N {
            let parent = parentNodes[i]
            
            if parent != -1 {
                twoDimArray[parent].append(i)
            }
        }
        
        let parentOfDelete = parentNodes[toDelete]
        
        if parentOfDelete == -1 {
            print(0)
            return
        }
        
        twoDimArray[parentOfDelete].removeAll(where: { $0 == toDelete })
        
        let root = Int(parentNodes.firstIndex(of: -1)!)
        var needToVisit = [root]
        
        while !needToVisit.isEmpty {
            let nextNode = needToVisit.removeFirst()
            
            if twoDimArray[nextNode].isEmpty {
                count += 1
                continue
            }
            
            needToVisit.append(contentsOf: twoDimArray[nextNode])
        }
        
        print(count)
    }
}
