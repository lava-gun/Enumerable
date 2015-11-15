module Enumerable
	def my_each
		return self unless block_given?
		i = 0
		for i in 0...length
			yield(self[i])
		end
	end
	def my_each_with_index
		return self unless block_given?
		i = 0
		for i in 0...length
			yield(self[i], i)
		end
	end
	def my_select
		return self unless block_given?
		new_array = [] 
		my_each{|i| new_array << i if yield(i)}
		new_array
	end
	def my_all?
		return self unless block_given?
		choice = true
		for i in 0...length
			if !yield(i)
				return choice = false
				break
			end
		end
		return choice
	end
	def my_any?
		if block_given?
			my_each{|i| return true if yield(i)}
		else
			my_each{|i| return true if i}
		end
		false
	end
	def my_none?
		if block_given?
			my_each{|i| return false if yield(i)}
		else
			my_each{|i| return false if yield(i)}
		end
		return true
	end
	def my_count( x = nil )
		count = 0
		if block_given?
			my_each{|i| count += 1 if yield(i)}
		elsif x==nil
			my_each{|i| count += 1 if i}
		else
			my_each{|i| count += 1 if i == x}
		end
		count
	end
	def my_map(code_block)
    new_array = []
    if code_block
      my_each do |i|
        new_array << code_block.call(i)
      end
      return new_array
    else
      return self
    end
  end
	def my_inject(x = 1)
		count = x.nil? ? first : x
		my_each {|i| count = yield(count, i)}
		count
	end

end

def multiply_els(stuff)
	stuff.my_inject(1){|things, n| things*n}	
end

array = [1,2,3,4,5]

temp = array.my_inject(1){|sum, n| sum + n}
puts"*1*"
puts temp
puts
puts

temp = array.inject(1){|sum, n| sum + n}
puts "*2*"
puts temp 

temp = multiply_els([2,4,5])
puts 
puts
puts
puts "#=> #{temp}"