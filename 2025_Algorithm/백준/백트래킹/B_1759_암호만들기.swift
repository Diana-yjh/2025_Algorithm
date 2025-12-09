//
//  B_1759_암호만들기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 12/8/25.
//

struct B_1759_암호만들기 {
    func solution() {
        let input = readLine()!.split(separator: " ").map{ Int($0)! }
        let L = input.first!
        let wordList = readLine()!.split(separator: " ").map{ String($0) }
        
        var passwordList: [String] = []
        
        backTracking(password: "", arr: wordList.sorted())
        
        func backTracking(password: String, arr: [String]) {
            for i in 0 ..< arr.count {
                var editedPW = password
                
                let nextArr = arr[i+1..<arr.count].map{ String($0) }
                
                editedPW += arr[i]
                
                if nextArr.count < L - editedPW.count {
                    return
                }
                
                if editedPW.count == L {
                    passwordList.append(editedPW)
                    continue
                }
                
                backTracking(password: editedPW, arr: nextArr)
            }
        }
        
        let vowel: [Character] = ["a", "e", "i", "o", "u"]
        
        for i in 0..<passwordList.count {
            let filteredWord = passwordList[i].filter{ !(vowel.contains($0)) }
            
            if filteredWord.count == passwordList[i].count {
                continue
            }
            
            if filteredWord.count < 2 {
                continue
            }
            
            print(passwordList[i])
        }
    }
}
