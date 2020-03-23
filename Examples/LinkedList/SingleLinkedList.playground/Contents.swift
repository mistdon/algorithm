import UIKit

// 单向链表
public class ListNode {
    public var val : Int
    public var next: ListNode?
    public init(_ val: Int, next: ListNode? = nil){
        self.val = val
        self.next = next
    }
}
class Solution {
    func deleteNode(_ head: ListNode?, _ val: Int) -> ListNode? {
        var head = head
        while head != nil && head?.val == val {
            head = head?.next
        }
        var prev = head
        while prev?.next != nil {
            if prev?.next?.val == val {
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
    /// 从未到头打印链表
    func printListNodeFromTail(_ head: ListNode?) {
       guard let _head = head else{
           return
       }
       if _head.next != nil {
           printListNodeFromTail(_head.next)
       }
       print(_head.val)
    }
    /// 正向打印一个链表
    func printListNode(_ head: ListNode?){
       guard let _head = head else { return }
       print(_head.val)
       if _head.next != nil {
           printListNode(_head.next)
       }
    }
    /// 反转链表，输出表头(递归)
    func reverseList(_ head: ListNode?) -> ListNode? {
       if head == nil || head?.next == nil {
           return head
       }
       let next = reverseList(head!.next)
       head!.next?.next = head
       head!.next = nil
       return next
    }
    /// 链表的中间节点
    /// 典型的快慢指针法，快指针的速度是慢指针的两倍，当快追针到达链表的尾点时，慢指针到达中间节点
    func middleNoe(_ head: ListNode?) -> ListNode? {
        if head == nil { return nil}
        var fast = head
        var slow = head
        while fast != nil && fast?.next != nil {
            fast = fast?.next?.next
            slow = slow?.next
        }
        return slow
    }
}
let sol = Solution()
// 1 -> 2 -> 3 -> 4 -> 5
let node5 = ListNode(5)
let node4 = ListNode(4, next: node5)
let node3 = ListNode(3, next: node4)
let node2 = ListNode(2, next: node3)
let node1 = ListNode(1, next: node2)

/// 测试
let KthTailNode0 = Solution().FindKthToTail(head: node1, k: 0)
let KthTailNode1 = Solution().FindKthToTail(head: node1, k: 2)
let KthTailNode2 = Solution().FindKthToTail(head: node1, k: 10)

// 打印链表
sol.printListNode(sol.reverseList(node1))




