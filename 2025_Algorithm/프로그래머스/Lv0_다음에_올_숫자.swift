//
//  다음에_올_숫자.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/6/26.
//

import Foundation

func solution(_ common:[Int]) -> Int {
    var array: [Int] = []
    
    array.append(common[1] - common[0])
    array.append(common[2] - common[1])

    var last = common.last ?? 0
    
    if array[0] == array[1] {
        return last + array[0]
    } else {
        let x = common[1] / common[0]
        return last * x
    }
}
