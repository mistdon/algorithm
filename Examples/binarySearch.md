## 二分搜索算法(Binary Search)

二分搜索(Binary search), 也称*折半搜索*、*对数搜索*，是一种在有序数组中查找某一特定元素的搜索算法。搜索过程从素组的中间元素开始，如果中间元素正好是要查找的元素，则搜索过程结束；如果某一个特定元素大于或者小于中间元素，则在数组大于或者小于中间元素的那一半查找，而且跟开始一样从中间元素开始比较。如果在某一步数组为空，则代表找不到。这种搜索算法每一次比较都使搜索范围缩小半。

在开始之前需要先明确几个问题：

1. 如果源数组不是有序数组，如何返回错误信息？

2. 源数组是整数数组，还是浮点型数组？

   

算法实现如下：

非递归版本：

```swift
func binarySearch(sortedItems: [Int], for target: Int) -> Int?{
    var start = 0, count = sortedItems.count - 1
    while start <= count {
        let mid = start + (count - start) / 2
        if sortedItems[mid] == target{
            return mid
        }else if sortedItems[mid] < target{
            start = mid + 1
        }else{
            count = mid - 1
        }
    }
    return nil
}
let res = binarySearch(sortedItems: [1, 2, 3, 18, 22, 77, 89, 100], for: 89)
// res = 6 即目标值处于index=6的位置上
```

递归版本

```swift
func binarySearch(arr: [Int], start: Int, end: Int, khey: Int) -> Int? {
    guard start < end else {
        return nil
    }
    let mid = start + (end - start) / 2
    if arr[mid] > khey {
        return binarySearch(arr: arr, start: start, end: mid - 1, khey: khey)
    } else if arr[mid] < khey {
        return binarySearch(arr: arr, start: mid + 1, end: end, khey: khey)
    } else {
        return mid
    }
}
let arr = [1, 2, 3, 18, 22, 77, 89, 100]
let res = binarySearch(arr: arr, start: 0, end: arr.count, khey: 89)
// res = 6 即目标值处于index=6的位置上
```



上面的算法虽然实现了主要功能，但是就如我们上面谈到的，如果源数组是浮点型的话，如何处理？

以下是面向协议的实现：

```swift
extension Array where Element: Comparable{
    func binarySearch<T: Comparable>(arr: [T], for target: T) -> Int? {
        var start = 0, count = arr.count - 1
        while start <= count {
            let mid = start + (count - start) / 2
            if arr[mid] == target{
                return mid
            }else if arr[mid] < target{
                start = mid + 1
            }else{
                count = mid - 1
            }
        }
        return nil
    }
}
```



参考链接：

- [二分搜索算法](https://zh.wikipedia.org/wiki/%E4%BA%8C%E5%88%86%E6%90%9C%E7%B4%A2%E7%AE%97%E6%B3%95)