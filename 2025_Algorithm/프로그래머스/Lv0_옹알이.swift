//
//  옹알이.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/6/26.
//

import Foundation

func solution(_ babbling:[String]) -> Int {
    let sounds = ["aya", "ye", "woo", "ma"]
    var count = 0
    
    babbling.forEach { item in
        var w = item
                      
        for sound in sounds {
            w = w.replacingOccurrences(of: sound, with: " ")
        }
                      
        if w.allSatisfy({ $0 == " " }) {
            count += 1
        }
    }
    return count
}
