# frozen_string_literal: true

class Tree
  attr_accessor :root, :data

  def initialize(arr)
    @data = arr.sort.uniq
    @root = build_tree(data)
  end

  # transforms data into balanced binary tree with nodes properly positioned.
  # returns the root node.
  def build_tree(arr)
    return nil if arr.empty?

    middle = (arr.size - 1) / 2
    root_node = Node.new(arr[middle])

    root_node.left = build_tree(arr[0...middle])
    root_node.right = build_tree(arr[(middle + 1)..-1])

    root_node
  end

  def insert(value, node = root)
    return node if value == node.data

    if value < node.data
      node.left.nil? ? node.left = Node.new(value) : insert(value, node.left)
    else
      node.right.nil? ? node.right = Node.new(value) : insert(value, node.right)
    end
    node
  end

  def delete(value, node = root)
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif value > node.data
      node.right = delete(value, node.right)
    else
      return node.left if node.left.nil?
      return node.right if node.right.nil?

      leftmost_node = leftomost_leaf(node.right)
      node.data = leftmost_node.data
      node.right = delete(leftmost_node.data, node.right)
    end
    node
  end

  def leftmost_leaf(node)
    node = node.left until node.left.nil?

    node
  end

  # search within tree for provided value
  def find(value)
    return true if root.value == value

    find_helper(root, value)
  end

  def find_helper(node, value)
    return if node.nil?

    return true if node.value == value

    found = find_helper(node.left, value)
    return found if found == true

    find_helper(node.right, value)
  end
end

class Node
  attr_accessor :left, :right, :data

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
end

arr = Array.new(10) { rand(1..100) }
bst = Tree.new(arr)
puts bst.root.data
bst.insert(45)
