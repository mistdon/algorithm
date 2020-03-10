//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport

// 数字交换
var a = 5, b = 6
//1. 中间变量法
func swap1(_ a: inout Int, _ b: inout Int){
    let temp = a
    a = b
    b = temp
}
//2. 自加法
func swap2(_ a: inout Int, _ b: inout Int){
    a = a + b
    b = a - b
    a = a - b
}
//3. 使用按位异或操作符
func swap3(_ a: inout Int, _ b: inout Int){
    a = a ^ b
    b = b ^ a
    a = a ^ b
}
//assert((a == 6) && (b == 5), "swap success")
//swap1(&a, &b)
//swap2(&a, &b)
swap3(&a, &b)
assert((a == 6) && (b == 5))

// 字符串
/*
 Q: 在字符串中找出第一个只出现一次的字符
 */

func findFirstCharOccureOnce(from string: String) -> String{
    guard string.count > 0 else {
        return ""
    }
    var result = ""
    var map = [Character: Int]()
    for char in string {
        if let count = map[char], count > 0 {
            map[char] = count + 1
        }else{
            map[char] = 1
        }
    }
    for char in string{
        if let count = map[char], count == 1{
            result = String(char)
            break;
        }
    }
    return result
}

assert(findFirstCharOccureOnce(from: "asfasfsdfk") == "d")

