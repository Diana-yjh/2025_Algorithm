//
//  Queue.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/2/25.
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

