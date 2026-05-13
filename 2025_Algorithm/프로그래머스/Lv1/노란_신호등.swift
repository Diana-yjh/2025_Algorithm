//
//  노란_신호등.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/8/26.
//

import Foundation

func solution(_ signals:[[Int]]) -> Int {
    let leastMin = signals.map { $0.reduce(0){ $0 + $1 } }.reduce(1){ lcm($0, $1) }

    for i in 1...leastMin {
        if signals.allSatisfy({ isYellow(t: i, signal: $0)}) {
            return i
        }
    }
    
    return -1
}

func isYellow(t: Int, signal: [Int]) -> Bool {
    let period = signal[0] + signal[2] + signal[1]
    
    return t % period > signal[0] && t % period <= signal[0] + signal[1]
}

func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a / gcd(a, b) * b
}
