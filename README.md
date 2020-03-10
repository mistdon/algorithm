# algorithm

常见算法解析及举例


1. [排序](./Examples/Sorted/README.md)

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
}
   ```

2. [链表](./Examples/LinkedList/README.md)
   举例：
   ```swift
   public class LinkedList<T> {
		public func reverse() {
		    var node = head
		    tail = node
		    while let currentNode = node {
		        node = currentNode.next
		        swap(&currentNode.next, &currentNode.previous)
		        head = currentNode
		    }
		}
   }
	 
   ```

- [二分搜索算法](./Examples/binarySearch.md)

#### References

- [Swift algorithm club](https://github.com/raywenderlich/swift-algorithm-club)
