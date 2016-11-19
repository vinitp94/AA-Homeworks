class Stack
  attr_reader :my_stack

  def initialize
    @my_stack = []
  end

  def add(el)
    my_stack.push(el)
  end

  def remove
    my_stack.pop
  end

  def show
    my_stack
  end
end

# plates = Stack.new
# plates.add(1)
# plates.add(10)
# plates.add(43)
# plates.remove
# plates.add(567)
# p plates.show

class Queue
  attr_reader :my_queue

  def initialize
    @my_queue = []
  end

  def enqueue(el)
    my_queue.push(el)
  end

  def dequeue
    my_queue.shift
  end

  def show
    my_queue
  end
end

# plates = Queue.new
# plates.enqueue(1)
# plates.enqueue(10)
# plates.enqueue(43)
# plates.dequeue
# plates.enqueue(567)
# p plates.show

class Map
  attr_reader :my_map

  def initialize
    @my_map = []
  end

  def assign(key, value)
    if my_map.none? { |pair| pair[0] == key }
      my_map << [key, value]
    end
    nil
  end

  def lookup(key)
    index = my_map.find_index { |pair| pair[0] == key }
    return my_map[index][1] if index
    nil
  end

  def remove(key)
    my_map.delete_if { |pair| pair[0] == key }
  end

  def show
    my_map
  end
end

# hash = Map.new
# hash.assign(2, 4)
# hash.assign("idk", false)
# hash.assign(6, "str")
# hash.assign("i point to nothing", nil)
# p hash.lookup(2)
# p hash.lookup("i point to nothing")
# hash.remove("idk")
# hash.remove(2)
# p hash.show
