def bubble_sort(array)
  array.each do |i|
    for j in 0..(array.length - 2)
      if array[j] > array[j + 1]
        temp = array[j]
        array[j] = array[j+1]
        array[j+1] = temp
      end
    end
  end
  return array
end

p bubble_sort([4,3,78,2,0,2])
