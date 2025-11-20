//
//  B_2816_디지털티비.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 11/9/25.
//

// Diana - 좀 더 생각해볼 문제

struct B_2819_디지털티비 {
    func solution() {
        let N = Int(readLine()!)!
        var channels = (0..<N).map { _ in readLine()! }
        var result: String = ""
        
        if let kbs1Index = channels.firstIndex(of: "KBS1") {
            result += String(repeating: "1", count: kbs1Index)
            result += String(repeating: "4", count: kbs1Index)
            
            let item = channels.remove(at: kbs1Index)
            channels.insert(item, at: 0)
        }
        
        if let kbs2Index = channels.firstIndex(of: "KBS2") {
            result += String(repeating: "1", count: kbs2Index)
            result += String(repeating: "4", count: kbs2Index - 1)
            
            let item = channels.remove(at: kbs2Index)
            channels.insert(item, at: 1)
        }
        
        print(result)
    }
}
