//
//  B_1011_FlyMeToTheAlphaCentauri.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/12/25.
//

struct B_1011_FlyMeToTheAlphaCentauri {
    func solution() {
        let testcase = Int(readLine()!)!
        
        for _ in 0 ..< testcase {
            let input = readLine()!.split(separator: " ").map{ Int($0)! }
            let start = input[0], end = input[1]
            let distance = end - start
            
            var number = 1
            var result = 2
            
            if distance == 1 {
                print(1)
                continue
            } else if distance == 2 {
                print(2)
                continue
            } else {
                for i in 2... {
                    var breakPoint: Bool = false
                    
                    for _ in 0..<2 {
                        number += i
                        
                        result += 1
                        
                        if number >= distance - 1 {
                            breakPoint = true
                            break
                        }
                    }
                    
                    if breakPoint {
                        print(result)
                        break
                    }
                }
            }
        }
    }
}
