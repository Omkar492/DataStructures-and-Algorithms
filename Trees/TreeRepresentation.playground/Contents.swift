import Foundation

class BinarySearchTree {
    var value: Int
    var left: BinarySearchTree?
    var right: BinarySearchTree?
    var parent: BinarySearchTree?
    var isLeaf: Bool {
        return left == nil && right == nil
    }
    var isLeft: Bool {
        return value < parent!.value
    }
    var isRight: Bool {
        return value < parent!.value
    }
    var hasLeft: Bool {
        return left != nil
    }
    var hasRight: Bool {
        return right != nil
    }

    init(value: Int) {
        self.value = value
    }
}

extension BinarySearchTree {
    func insert(value: Int) {
        insert(value: value, parent: self)
    }
    
    private func insert(value: Int, parent: BinarySearchTree) {
        if value < self.value {
            if let left = left {
                left.insert(value: value, parent: self)
            } else {
                left = BinarySearchTree(value: value)
                left?.parent = self
            }
        } else {
            if let right = right {
                right.insert(value: value, parent: self)
            } else {
                right = BinarySearchTree(value: value)
                right?.parent = self
            }
        }
    }
}

extension BinarySearchTree: CustomStringConvertible {
    
    var description: String {
        var result = ""
        
        if let left = self.left {
            result += "("
            result += left.description
            result += ") <= "
        }
        
        result += "\(value)"
        
        if let right = self.right {
            result += " => ("
            result += right.description
            result += ")"
        }

        return result
    }
    
}

let tree = BinarySearchTree(value: 7)
tree.insert(value: 2)
tree.insert(value: 1)
print(tree)

//tree.insert(value: 4)
//tree.insert(value: 3)
//
//tree.insert(value: 10)
//tree.insert(value: 9)
//tree.insert(value: 12)
//tree.insert(value: 11)

