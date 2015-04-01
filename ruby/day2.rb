#!/usr/local/env ruby


# opening a file
puts open('../LICENSE').read()


# opening a file, in a block; we can lock it while we read.
File.open('../LICENSE', 'r') { |f|
  f.flock(File::LOCK_SH)
  puts f.read
}


# translate a hash to an array?  (also iterate thru the hash)
# this converts the hash to an array of [key, value] arrays.
h = {:a => 1, :b => 2, :c => 3}
a = []
h.each { |x,y| a.push([x, y]) }

# ^ could also be done with:
a = Array(h.to_enum)


# convert a Hash to an array?
a = [1, 2, 3, 4]
h = {}
a.each_index { |i| h[i] = a[i] }  # h = {0 => 1, 1 => 2, 2 => 3, 3 => 4}

# Arrays can be stacks with a.push/a.pop.
# Arrays can be queues. FIFO/FILO
a = [1, 2, 3, 4]
a.delete_at(0)  # 1
a.delete_at(-1) # 4


# Exercises!
# Print the contents of an array of sixteen numbers, four numbers at a time,
# using just each...
a = Array(0..15)
a.each do |i|
  m = i * 4      # lower bound for a slice of 4
  n = i * 4 + 3  # upper bound for a slice of 4
  if n < 16
    puts "#{a[m..n]}"
  end
end

# Now, do the same with each_slice in Enumerable.
a.each_slice(4) { |x| puts "#{x}" }


# The Tree class was interesting, but it did not allow you to specify a new
# tree with a clean user interface. Let the initializer accept a nested
# structure with hashes and arrays. You should be able to specify a tree like
# this:
family = {
  'grandpa' => {
    'dad'   => {'child 1' => {}, 'child 2' => {} },
    'uncle' => {'child 3' => {}, 'child 4' => {} }
  }
}


class Tree
  attr_accessor :children, :node_name

  def initialize(name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block }
  end

  def visit(&block)
    block.call self
  end
end



# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do a simple
# regular expression match and read lines from a file. (This is surprisingly
# simple in Ruby.) If you want, include line numbers.
