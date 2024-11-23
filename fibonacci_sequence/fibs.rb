#fibonacci sequence using loop
def fibs(n)
  array = []
  for i in 0...n
    if i < 2
      array << i
    else
      array << array[i - 1] + array[i - 2]
    end
  end
  array
end


p fibs(8)

#fibonacci sequence using recursion
def fibs_rec(n)
  return [0] if n == 1 
  return [0, 1] if n == 2 
  array = fibs_rec(n - 1)
  array << (array[-1]+ array[-2])

end
p fibs_rec(8)