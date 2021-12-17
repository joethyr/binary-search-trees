#
class BinarySearchTree
  attr_accessor :root

  def initialize(node)
    @root = node
  end
end

class Node
  attr_accessor :left, :right, :value

  def initialize(left = nil, right = nil, value = nil)
    @left = left
    @right = right
    @value = value
  end
end

test = BinarySearchTree.new(Node.new(2, 5, 3))
puts test.root.left
puts test.root.right
puts test.root.value
