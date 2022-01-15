class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        # p val
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node)
        # p node
        @parent = node 
        if node != nil
            node.children << self if !node.children.include?(self)
        end
        if node != nil && node.parent != nil 
            i = node.parent.children.index(self)
            node.parent.children.delete_at(i) unless i == nil
        end
    end

    def add_child(child)
        child.parent=(self)
    end

    def remove_child(child)
        raise if child.parent == nil
        child.parent = nil
    end

    def dfs(target)
        return self if self.value == target
    
        self.children.each do |child|
            current_value = child.dfs(target)
            return current_value unless current_value == nil
        end
        nil
    end

    def bfs(target)
        queue = [self]

        until queue.empty? 
            ele = queue.shift
            return ele if ele.value == target
            ele.children.each do |child|
                queue << child
            end
        end
        nil
    end
end

# a = PolyTreeNode.new('new_node')
# b = PolyTreeNode.new('different_node')
# a.parent=(b)