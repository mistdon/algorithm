//: Playground - noun: a place where people can play

import UIKit

/// 8大排序算法

var arr = [Int](repeating: 0, count: 10)
for index in 0..<10{
    arr[index] = Int(arc4random_uniform(10)) + 1
}
extension Array where Element : Comparable {
    /// 冒泡排序
    /// 冒泡排序是最稳定的排序算法，最容易实现的排序。最坏的情况是每次都需要交换，时间复杂度是O(n^2), 空间复杂度是O(1)
    public mutating func bubbleSort() {
        let count = self.count
        guard count > 1 else { return }
        for i in 0..<count {
            for j in 0..<count - 1 - i {
                if self[j] > self[j + 1] {
                    (self[j], self[j + 1]) = (self[j + 1], self[j]) // tuple feature
                    print(self)
                }
            }
        }
    }
}
extension Array where Element : Comparable {
    /// 选择排序
    /// 首先在未排序列中找到最小(大)的元素，存放在排序序列的起始位置; 然后再从剩余未排序的元素中找到最小(大)数，然后放到已排序列表的末尾, 已此类推
    public mutating func selectionSort(){
        let count = self.count
        guard count > 1 else { return }
        for i in 0..<count {
            var minIndex = i
            for j in (i+1)..<count {
                if self[j] < self[minIndex] {
                    minIndex = j
                }
            }
            if i != minIndex {
                (self[i], self[minIndex]) = (self[minIndex], self[i]) // tuple feature
            }
        }
    }
}
extension Array where Element : Comparable {
    /// 插入排序
    /// 通过构建有序序列，对于未排序数据，在已排序序列中从后往前扫描，找到相应位置并插入。
    public mutating func insertSort() {
        let count = self.count
        guard count > 1 else { return }
        for i in 1..<count {
            var preIndex = i - 1
            let current = self[i]
            while preIndex >= 0 && current < self[preIndex] {
                self[preIndex + 1] = self[preIndex]
                preIndex -= 1
            }
            self[preIndex + 1] = current
        }
    }
}
extension Array where Element : Comparable {
    /// 快速排序
    public mutating func quickSort() {
        func quickSort(left: Int, right: Int) {
            guard left < right else { return }
            var i = left +  1, j = left
            let key = self[left]
            while i <= right {
                if self[i] < key {
                    j += 1
                    (self[i], self[j]) = (self[j], self[i])
                }
                i += 1
            }
            (self[left], self[j]) = (self[j], self[left])
            quickSort(left: j + 1, right: right)
            quickSort(left: left, right: j - 1)
        }
        quickSort(left: 0, right: self.count - 1)
    }
}
//arr.bubbleSort()
//
//arr.selectionSort()

//arr.insertSort()

arr.quickSort()

print(arr)
