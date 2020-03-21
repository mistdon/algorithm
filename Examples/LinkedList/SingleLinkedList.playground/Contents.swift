import UIKit

// 单向链表
// 4 -> 3 -> 2 -> 1

public class ListNode: CustomStringConvertible {
    public var value : Int
    public var next: ListNode?
    public init(value: Int, next: ListNode? = nil){
        self.value = value
        self.next = next
    }
    public var description: String {
        return String(self.value)
    }
}
class Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        while head != nil && head?.value == val {
            head = head?.next
        }
        var prev = head
        while prev?.next != nil {
            print(prev?.value)
            if prev?.next?.value == val {
                prev?.next = prev?.next?.next
            } else {
                prev = prev?.next
            }
        }
        return head
    }
    /// 找到链表中倒数第k个节点
    func FindKthToTail(head: ListNode?, k: Int) -> ListNode?{
        guard let _head = head else { return nil}
        guard k > 0 else { return nil }
        var fastNode: ListNode? = _head
        var slowNode: ListNode?
        for _ in 0..<k-1{
            fastNode = fastNode?.next
        }
        if fastNode == nil { // k大于节点总数
            return nil
        }
        slowNode = _head
        while fastNode?.next != nil {
            fastNode = fastNode?.next
            slowNode = slowNode?.next
        }
        return slowNode
    }
}
let node1 = ListNode(value: 1)
let node2 = ListNode(value: 2, next: node1)
let node3 = ListNode(value: 3, next: node2)
let node4 = ListNode(value: 4, next: node3)

//let res = Solution().deleteNode(node3, 2)
//print(node3.next?.value)
/// 测试
let KthTailNode0 = Solution().FindKthToTail(head: node4, k: 0)
let KthTailNode1 = Solution().FindKthToTail(head: node4, k: 2)
let KthTailNode2 = Solution().FindKthToTail(head: node4, k: 10)




