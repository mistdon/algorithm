# algorithm

常见算法解析及举例


1. [排序(点击查看更多例子)](./Examples/Sorted/README.md)

```swift
extension Array where Element : Comparable {
  /// 选择排序
  /// 首先在未排序列中找到最小(大)的元素，存放在排序序列的起始位置; 然后再充剩余未排序的元素中找到最小(大)数，然后放到已排序列表的末尾y, 已此类推
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
          (self[i], self[minIndex]) = (self[minIndex], self[i]) // tuple feature
      }
  }
```

2. [链表(点击查看更多例子)](./Examples/LinkedList/README.md)

```swift
/// 链表中倒数第K的节点
/// - Parameter k: k 最后一个默认为第一个
public func FindKthToTail(k: Int) -> ListNode<T>? {
    ///判断链表表头是否为空
    guard let temp = self.head else { return nil }
    guard k > 0 else { return nil }
    /// 双指针法
    var fast = temp // 快指针
    var slow = temp // 慢指针
    /// 快指针先走K步
    var position: Int = k
    while position > 1 {
        if let _next = fast.next {
            fast = _next
            position -= 1
        }else{
            return nil
        }
    }
    /// 两个指针一起走，知道快指针到达链表的尾j节点
    while fast.next != nil {
        fast = fast.next!
        slow = slow.next!
    }
    return slow
}
```
- [二分搜索算法](./Examples/binarySearch.md)

#### References

- [Swift algorithm club](https://github.com/raywenderlich/swift-algorithm-club)
