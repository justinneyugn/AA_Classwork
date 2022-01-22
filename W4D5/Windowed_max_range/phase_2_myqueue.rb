class MyQueue
    def initialize
        @store = []
    end

    def peek
        @store[-1]
    end

    def size
        @store.length
    end

    def empty?
        @store.empty?
    end

    def enqueue(num)
        @store.push(num) 
    end

    def dequeue
        @store.shift
    end
end