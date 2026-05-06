//
//  Lv0_문자열_밀기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/6/26.
//

import Foundation

func solution(_ A:String, _ B:String) -> Int {
    var Aarray: [String] = []
    var Barray: [String] = []
    var count: Int = 0
    
    for char in A {
        Aarray.append(String(char))
    }
    
    for char in B {
        Barray.append(String(char))
    }
    
    while Aarray != Barray && count < Aarray.count {
        let last = Aarray.removeLast()
        Aarray = [last] + Aarray
        count += 1
    }
    
    if Aarray == Barray {
        return count
    } else {
        return -1
    }
}
