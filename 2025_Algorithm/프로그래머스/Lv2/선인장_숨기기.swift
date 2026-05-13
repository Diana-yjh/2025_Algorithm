////
////  선인장_숨기기.swift
////  2025_Algorithm
////
////  Created by Yejin Hong on 5/6/26.
////
//
//import Foundation
//
//func solution(_ m:Int, _ n:Int, _ h:Int, _ w:Int, _ drops:[[Int]]) -> [Int] {
//    var array: [([Int], [Int])] = []
//    
//    for j in 0...m-h {
//        for i in 0...n-w {
//            search(array: &array, start: [j, i], drops: drops, h: h, w: w)
//        }
//    }
//    
//    var maxNum = 0
//    var result: [Int] = []
//    
//    for a in array {
//        maxNum = max(maxNum, a.1.min()!)
//        result.append(maxNum)
//    }
//    
//    if let maxFirstIndex = result.firstIndex(of: 51) {
//        return array[maxFirstIndex].0
//    }
//    
//    let resultFirstIndex = result.firstIndex(of: result.max()!)
//    
//    return array[resultFirstIndex!].0
//}
//
//func search(array: inout [([Int], [Int])], start: [Int], drops:[[Int]], h: Int, w: Int) {
//    var indexs: [Int] = []
//    
//    for height in 0..<h {
//        for width in 0..<w {
//            let row = start[0] + height
//            let column = start[1] + width
//            var lastIndex = 51
//            
//            if let index = drops.firstIndex(of: [row, column]) {
//                 lastIndex = index + 1
//            }
//            
//            indexs.append(lastIndex)
//        }
//    }
//    
//    array.append((start, indexs))
//}

//func solution(_ m: Int, _ n: Int, _ h: Int, _ w: Int, _ drops: [[Int]]) -> [Int] {
//    // 좌표 → 떨어진 순서(1-based) 매핑. firstIndex(of:)는 O(N)이라 매번 부르면 비효율.
//    var dropOrder: [[Int]: Int] = [:]
//    for (i, drop) in drops.enumerated() {
//        dropOrder[drop] = i + 1
//    }
//    
//    let neverHit = drops.count + 1   // 51 같은 매직 넘버 대신
//    var bestStart = [0, 0]
//    var bestSurvival = -1
//    
//    for j in 0...(m - h) {
//        for i in 0...(n - w) {
//            // 이 위치에서 시작하는 직사각형의 생존 시간 = 가장 빨리 맞는 셀의 인덱스
//            var survival = neverHit
//            
//            outer: for dy in 0..<h {
//                for dx in 0..<w {
//                    let hitTime = dropOrder[[j + dy, i + dx]] ?? neverHit
//                    survival = min(survival, hitTime)
//                    if survival == 1 { break outer }  // 1보다 작아질 수 없음
//                }
//            }
//            
//            // `>` 라서 동률일 땐 먼저 발견한 위치(행 우선)가 유지됨
//            if survival > bestSurvival {
//                bestSurvival = survival
//                bestStart = [j, i]
//            }
//        }
//    }
//    
//    return bestStart
//}
