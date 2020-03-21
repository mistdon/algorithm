import UIKit

// LeetCode 二叉树

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
class Solution {
    
    var res = [Int]()
    /// 前序遍历（递归）
    func preorderTraversal(_ root: TreeNode?) {
        guard let node = root else { return }
        print(node.val)
        res.append(node.val)
        preorderTraversal(node.left)
        preorderTraversal(node.right)
    }
    /// 前序遍历 (迭代)
    func stack_preorderTraversal(_ root: TreeNode?) -> [Int]{
//        guard let root = root else { return [] }
//
//        var stack = [TreeNode]()
//
//        var output = [Int]()
        
        
        
        return [Int]()
    }
    /// 中序遍历（递归）
    func inoderTraversal(_ root: TreeNode?) {
        guard let node = root else { return }
        inoderTraversal(node.left)
        res.append(node.val)
        inoderTraversal(node.right)
    }
    /// 后序遍历 （递归）
    func postorderTraversal(_ root: TreeNode?) {
        guard let node = root else { return }
        postorderTraversal(node.left)
        postorderTraversal(node.right)
        res.append(node.val)
    }
    func reset() {
        res.removeAll()
    }
    /// 二叉树的深度
    func treeDepth(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }
        let leftDepth = treeDepth(root.left)
        let rightDepth = treeDepth(root.right)
        return leftDepth > rightDepth ? (leftDepth + 1) : (rightDepth  + 1)
    }
}
/*
          20
         /  \
        /    \
       10    30
      /  \   /
     5   15 25

 */
var root = TreeNode(20)
root.left = TreeNode(10)
root.left?.left = TreeNode(5)
root.left?.right = TreeNode(15)
root.right = TreeNode(30)
root.right?.left = TreeNode(25)

let soluation = Solution()

//soluation.preorderTraversal(root)
//print("preorder : \(soluation.res)")
//soluation.reset()

//soluation.inoderTraversal(root)
//print("inoder : \(soluation.res)")
//soluation.reset()
//
//soluation.postorderTraversal(root)
//print("postOrder: \(soluation.res)")
//soluation.reset()

soluation.treeDepth(root)
