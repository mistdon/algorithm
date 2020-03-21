import UIKit

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    /// 计算总节点数
    public var count: Int {
        switch self {
        case let .node(left, _, right):
            return left.count + 1 + right.count
        case .empty:
            return 0
        }
    }
    public func traverseInOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traverseInOrder(process: process)
            process(value)
            right.traverseInOrder(process: process)
        }
    }
    public func traversePreOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            process(value)
            left.traversePreOrder(process: process)
            right.traversePreOrder(process: process)
        }
    }
    public func traversePostOrder(process: (T) -> Void) {
        if case let .node(left, value, right) = self {
            left.traversePostOrder(process: process)
            right.traversePostOrder(process: process)
            process(value)
        }
    }
    /// 从上往下按层打印节点
    public func printFromTopToBottom() -> [T]{
        var nodes = [BinaryTree]()
        var data = [T]()
        nodes.append(self)
        while nodes.count > 0 {
            if let node = nodes.first {
                nodes.removeFirst()
                if case let .node(_, value, _) = node {
                    data.append(value)
                }
                if case let .node(left, _, _) = node {
                    nodes.append(left)
                }
                if case let .node(_, _, right) = node {
                    nodes.append(right)
                }
            }
        }
        return data
    }
}
extension BinaryTree : CustomStringConvertible {
    public var description: String {
        switch self {
            case let .node(left, value, right):
                return "value: \(value), left = \(left.description), right = \(right.description)"
            case .empty: return ""
        }
    }
}
/* 举例
                10
              /    \
             8      12
            / \      \
           6   9      15
          /
         4
 */
let node4 = BinaryTree.node(.empty, 4, .empty)
let node6 = BinaryTree.node(node4, 6, .empty)
let node9 = BinaryTree.node(.empty, 9, .empty)
let node8 = BinaryTree.node(node6, 8, node9)
let node15 = BinaryTree.node(.empty, 15, .empty)
let node12 = BinaryTree.node(.empty, 11, node15)
let node10 = BinaryTree.node(node8, 10, node12)


print("In order")
node10.traverseInOrder { (value ) in
    print(value)
}
print("pre order")
node10.traversePreOrder { (value) in
    print(value)
}
print("post order")
node10.traversePostOrder { (value) in
    print(value)
}
print("count: \(node10.count)")

node10.count

let result = node10.printFromTopToBottom()
