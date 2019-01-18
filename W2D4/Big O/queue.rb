class MyQueue
    def initialize
      @store = []
    end

    def peek
      @store.first
    end 

    def size
      @store.count
    end 

    def empty?
      @store.empty?
    end 

    def enqueue(value)
      @store.push(value)
    end 

    def dequeue
      @store.shift
    end 


end 