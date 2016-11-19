def sum_to(n)
  return nil if n < 1
  return 1 if n == 1
  n + sum_to(n-1)
end

def add_numbers(nums_array = nil)
  return nil if nums_array.nil?
  return nums_array[0] if nums_array.count == 1
  nums_array.pop + add_numbers(nums_array)
end

def gamma_fnc(n)
  return nil if n < 1
  return 1 if n == 1 || n == 2
  (n-1) * gamma_fnc(n-1)
end

#------------------------------------------------
# Test cases

p sum_to(5) == 15                 # => returns 15
p sum_to(1) == 1                  # => returns 1
p sum_to(9) == 45                 # => returns 45
p sum_to(-8).nil?                 # => returns nil

p add_numbers([1,2,3,4]) == 10    # => returns 10
p add_numbers([3]) == 3           # => returns 3
p add_numbers([-80,34,7]) == -39  # => returns -39
p add_numbers().nil?              # => returns nil

p gamma_fnc(0).nil?               # => returns nil
p gamma_fnc(1) == 1               # => returns 1
p gamma_fnc(4) == 6               # => returns 6
p gamma_fnc(8) == 5040            # => returns 5040
