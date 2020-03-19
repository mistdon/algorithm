

##### 链表

链表可以分为 单向链表，双向链表，循环链表，块状链表以及其他
```swift
public class LinkedListNode<T> {
    var value: T
    var next: LinkedListNode?
    weak var previous: LinkedListNode?
    public init(value: T) {
        self.value = value
    }
}
public class LinkedList<T> {
    public typealias Node = LinkedListNode<T>
    
    private var head: Node?
    
    private var tail: Node?
    
    public var isEmpty: Bool {
        return head == nil
    }
    public var fisrt : Node? {
        return head
    }
    public var last: Node? {
        guard var node = head else {
            return nil
        }
        while let next = node.next {
            node = next
        }
        return node
    }
    /// append new node
    /// - Parameter value: new node
    public func append(value: T) {
        let newNode = Node(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    public var count: Int {
        guard var node = head else {
            return 0
        }
        var count = 1
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    public func node(atIndex index: Int) -> Node {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil {
                    break
                }
            }
            return node!
        }
    }
    public subscript(index: Int) -> T {
        let node = self.node(atIndex: index)
        return node.value
    }
    public func insert(_ node: Node, atIndex index: Int) {
        let newNode = node
        if index == 0 {
            newNode.next = head
            head?.previous = newNode
            head = newNode
        } else {
            let prev = self.node(atIndex: index - 1)
            let next = prev.next
            newNode.previous = prev
            newNode.next = next
            prev.next = newNode
            next?.previous = newNode
        }
    }
    public func removeAll() {
        head = nil
    }
    public func remove(node: Node) -> T {
        let prev = node.previous
        let next = node.next
        if let prev = prev {
            prev.next = next
        }else{
            head = next
        }
        next?.previous = prev
        node.previous = nil
        node.next = nil
        return node.value
    }
    public func removeLast() -> T {
        assert(!isEmpty)
        return remove(node: last!)
    }
    public func removeAt(_ index: Int) -> T {
        let node = self.node(atIndex: index)
        return node.value
    }
    /// 反转
    public func reverse() {
        var node = head
        tail = node
        while let currentNode = node {
            node = currentNode.next
            swap(&currentNode.next, &currentNode.previous)
            head = currentNode
        }
    }
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
}
extension LinkedList : CustomStringConvertible {
    public var description: String {
        var s = "["
        var node = head
        while node != nil {
            s += "\(node!.value)"
            node = node!.next
            if node != nil {
                s += ", "
            }
        }
        return s + "]"
    }
}
let list = LinkedList<String>()
list.append(value: "Hello")
list.append(value: "World")
list.append(value: "Swift")
print(list.description)
```
以上为链表的常用操作。下面是常见的算法
```swift
/// 链表反转
public func reverse() {
    var node = head
    tail = node
    while let currentNode = node {
        node = currentNode.next
        swap(&currentNode.next, &currentNode.previous)
        head = currentNode
    }
}
```
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