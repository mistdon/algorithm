import UIKit


/// 算法: 翻转字符串, Swift 5.1

var str = "Hello, playground"

// Using swift lib
let res1 = String(str.reversed())
print(res1)

// Using char array and insert
func reverseString(_ str: String) -> String {
    guard str.count > 1 else { return str }
    var reversed = [Character]()
    for char in str {
        reversed.insert(char, at: 0)
    }
    return String(reversed)
}
let res2 = reverseString(str)

func revserse3String(_ str: String) -> String {
    guard str.count > 1 else { return str }
    var newWord = Array(str)
    let maxIndex = newWord.count - 1
    for i in 0...maxIndex {
        if i > maxIndex - i { break}
        (newWord[i], newWord[maxIndex - i]) = (newWord[maxIndex - i], newWord[i])
    }
    return String(newWord)
}
let res3 = revserse3String(str)

/*
 反转字符串中的所有单词(Google面试题)
 
 比如："the sky is blue", 反转后为 "blue is sky the".

*/

// 解题思路1: 1. 反转整个字符串, 2. 用空格将反转后的字符串分成数组; 3. 对数组内的字符串二次反转 4: 拼接最后字符串
