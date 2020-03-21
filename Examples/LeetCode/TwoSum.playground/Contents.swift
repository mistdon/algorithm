import UIKit

var str = "Hello, playground"

// 两数之和

// https://leetcode-cn.com/problems/two-sum/

/// 暴力枚举法，时间复杂度 O(n2), 空间复杂度O(1)
func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
    var res = [Int]()
    guard nums.count >= 2 else { return res }
    for i in 0..<nums.count {
        for j in (i+1)..<nums.count {
            if nums[i] + nums[j] == target {
                res.append(i)
                res.append(j)
                return res
            }
        }
    }
    return res
}
 /// 利用哈希表，时间复杂度为O(n),  空间复杂度为O(n)
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    var res = [Int]()
    for index in 0..<nums.count {
        dict[nums[index]] = index // 以value为key，以索引值为value
    }
    for index in 0..<nums.count {
        let difference = target - nums[index]
        if dict.keys.contains(difference) && dict[difference] != index{
            res.append(contentsOf: [index, dict[difference]!])
            return res
        }
    }
    return res
}
let res11  = twoSum1([2, 7, 11, 15], 13)
let res12  = twoSum1([3,3], 6)
let res21  = twoSum2([2, 7, 11, 15], 13)
let res22  = twoSum2([3,3], 6)
