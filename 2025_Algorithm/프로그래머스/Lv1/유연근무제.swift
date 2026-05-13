//
//  유연근무제.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/12/26.
//

import Foundation

func solution(_ schedules:[Int], _ timelogs:[[Int]], _ startday:Int) -> Int {
    var present = [[Bool]](repeating: [Bool](repeating: false, count: 7), count: schedules.count)
    
    for i in 0..<schedules.count {
        let schedule = schedules[i]
        let timelog = timelogs[i]
        let scheduledTime = (schedule / 100) * 60 + schedule % 100
        
        for t in 0..<7 {
            let dayOfWeek = (startday - 1 + t) % 7 + 1
            if dayOfWeek == 6 || dayOfWeek == 7 {
                present[i][t] = true
                continue
            }
            
            let hour = timelog[t] / 100
            let minutes = timelog[t] % 100
            
            let time = hour * 60 + minutes
            
            if time - scheduledTime <= 10 {
                present[i][t] = true
            }
        }
    }
    
    return present.filter { !($0.contains(false)) }.count
}
