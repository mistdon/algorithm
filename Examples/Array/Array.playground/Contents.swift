import UIKit

/*
  找出数组中重复的数字
 一个长度为n的数组里，所有的数字都在0～n-1的范围内。数组中的某些数字是重复的，但不知道几个数字重复了，也不知道每个数字重复了几次。
 请找出数组中任意一个重复的数字。
 例如，在长度为7的数组里 [2, 3, 1, 0, 2, 5, 3], 那么输出的数字可能是2或3
 */
extension Array where Element == Int {
    /// 方法1: 通过hash表存储元素, 若表中存在元素，则找到重复数字。查询时间O(1), 算法时间复杂度O(n)；需要一个hash表，空间复杂度为O(n)
    func findDuplicateNum1( _ arr: [Int]) -> Int? {
        var num: Int? // 未找到时
        /// 处理空数组
        if self.isEmpty {
            return num
        }
        /// 处理不符合要求的数组
        let length = self.count
        for index in self {
            if index < 0 || index > length - 1 {
                return num
            }
        }
        var hashMap = [Int: Int]()
        for index in arr {
            if hashMap.keys.contains(where: {$0 == index}){
                num = index
                break
            } else {
                hashMap[index] = 1
            }
        }
        return num
    }
}
/// 利用元素都在0～n-1的范围内的特点。若不存在重复数字就在与其相关索引的位置。即数字i在第i个位置。
/// 遍历的过程中寻找位置和元素不相同的值，并进行交换排序。时间复杂度O(n), 空间复杂度O(1)
func findDuplicateNum12( _ arr: [Int]) -> Int? {
    var num: Int?
    /// 处理空数组
    if arr.isEmpty {
        return num
    }
    /// 处理不符合要求的数组
    if arr.contains(where: {$0 < 0 || $0 > arr.count - 1}) {
        return num
    }
    var source = arr
    for index in 0..<source.count{
        while source[index] != index {
            if source[index] == source[source[index]] {
                num = source[index]
                return num
            }
            let temp = source[index]
            source[index] = source[temp]
            source[temp]  = temp
        }
    }
    return num
}
class Solution {
    func containsDuplicate(_ nums: [Int]) -> Bool {
        if nums.count == 0 {return false}
        if nums.contains(where: {$0 < 0 || $0 > nums.count - 1}) {
            return false
        }
        var hashMap = [Int: Int]()
        for index in nums {
            if hashMap.keys.contains(where: {$0 == index}) {
                return true
            } else {
                hashMap[index] = 1
            }
        }
        return false
    }
}
let source = [4, 3, 1, 0, 2, 3, 2]
let result  = source.findDuplicateNum1(source)
let result2 = findDuplicateNum12(source)
let result3 = Solution().containsDuplicate(source)
