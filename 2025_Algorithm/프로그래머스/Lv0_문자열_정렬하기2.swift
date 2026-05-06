//
//  Lv0_문자열_정렬하기2.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/6/26.
//

import Foundation

func solution(_ my_string:String) -> String {
    return my_string.lowercased().map{String($0)}.sorted().joined()
}
