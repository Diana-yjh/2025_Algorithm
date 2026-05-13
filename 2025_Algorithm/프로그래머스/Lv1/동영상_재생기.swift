//
//  동영상_재생기.swift
//  2025_Algorithm
//
//  Created by Yejin Hong on 5/12/26.
//

import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    var result: String = checkInOpening(time: pos, opStart: op_start, opEnd: op_end)
        
    for c in commands {
        switch c {
        case "prev":
            result = checkIsStartOrEnd(time: result, videoLength: video_len, sum: -10)
            result = checkInOpening(time: result, opStart: op_start, opEnd: op_end)
        case "next":
            result = checkIsStartOrEnd(time: result, videoLength: video_len, sum: 10)
            result = checkInOpening(time: result, opStart: op_start, opEnd: op_end)
        default:
            print("Command Error")
        }
    }
    
    result = checkInOpening(time: result, opStart: op_start, opEnd: op_end)
    
    return result
}

func checkIsStartOrEnd(time: String, videoLength: String, sum: Int) -> String {
    let now = timeToMinutes(time) + sum
    let start = 0
    let end = timeToMinutes(videoLength)
    
    if now < start {
        return "00:00"
    } else if now > end {
        return videoLength
    } else {
        let hours = now / 60
        let minutes = now % 60
        return String(format: "%02d:%02d", hours, minutes)
    }
}

func checkInOpening(time: String, opStart: String, opEnd: String) -> String {
    let now = timeToMinutes(time)
    let start = timeToMinutes(opStart)
    let end = timeToMinutes(opEnd)
    
    if now >= start && now <= end {
        return opEnd
    }
    
    return time
}

func timeToMinutes(_ time: String) -> Int {
    let t = time.split(separator: ":").map{ Int($0)! }
    let hour = t[0] * 60
    let minute = t[1]
    return hour + minute
}
