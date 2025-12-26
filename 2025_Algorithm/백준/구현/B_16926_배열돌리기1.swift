//
//  B_16926_배열돌리기1.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/11/25.
//

struct B_16926_배열돌리기1 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let column = input[0], row = input[1], rotation = input[2]
        var array = [[Int]](repeating: [], count: column)
        var rotateArray = [[Int]](repeating: [Int](repeating: 0, count: row), count: column)
        var copyArray = [[Int]]()
        
        (0..<column).forEach{ index in array[index] = readLine()!.split(separator: " ").map{ Int($0)! }}
        
        copyArray = array
        
        let directionX = [0, 1, 0, -1]
        let directionY = [1, 0, -1, 0]
        
        let boxes: Int = min(row, column) / 2
        
        for i in 0 ..< boxes {
            var start = (i, i)
            
            var next = (0, 0)
            var count = 1
            
            while true {
                if start.0 == i && (i..<column-1-i) ~= start.1 {
                    next = (start.0 + directionX[0], start.1 + directionY[0])
                } else if (i..<row-1-i) ~= start.0 && start.1 == column - 1 - i {
                    next = (start.0 + directionX[1], start.1 + directionY[1])
                } else if start.0 == row - 1 - i && (i+1...column - 1 - i) ~= start.1 {
                    next = (start.0 + directionX[2], start.1 + directionY[2])
                } else {
                    next = (start.0 + directionX[3], start.1 + directionY[3])
                }
                
                rotateArray[next.1][next.0] = copyArray[start.1][start.0]
                
                start = next
                
                if start == (i, i) {
                    if count < rotation {
                        count += 1
                        copyArray = rotateArray
                    } else {
                        copyArray = array
                        break
                    }
                }
            }
        }
        
        rotateArray.forEach { item in
            item.forEach { component in
                print(component, terminator: " ")
            }
            print("")
        }
    }
}
