

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
list.reverse()
print(list.description)
```