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
	def my_map
		new_array = []
		if block_given?
			self.my_each{|i| new_array << yield(i)}
			return new_array
		else return self
		end
	end
end

array = [1,2,3,4,5]

temp = array.my_map{|i| i**i}
puts"*1*"
puts temp
puts
puts

temp = array.map{|i| i**i}
puts "*2*"
puts temp 