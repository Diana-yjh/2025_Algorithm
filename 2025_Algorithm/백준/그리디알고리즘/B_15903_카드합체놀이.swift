//
//  B_15903_카드합체놀이.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 1/22/26.
//

struct B_15903_카드합체놀이 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let n = input[0], m = input[1]
        var array = readLine()!.split(separator: " ").map{ Int($0)! }
        
        var count = 0
        
        while count < m {
            count += 1
            
            array.sort()
            
            let first = array[0]
            let second = array[1]
            
            array[0] = first + second
            array[1] = first + second
        }
        
        var result = 0
        
        array.forEach { result += $0 }
        
        print(result)
    }
}
