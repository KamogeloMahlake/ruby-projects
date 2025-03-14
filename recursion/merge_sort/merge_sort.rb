# frozen_string_literal: true

array = [105, 79, 100, 110, 3, 2, 1, 13, 8, 5, 0, 1]

def merge_sort(array)
  return array if array.length <= 1

  middlepoint = (array.length / 2).to_i
  merge(merge_sort(array[0...middlepoint]), merge_sort(array[middlepoint..]))
end

def merge(arr1, arr2)
  result = []

  result << (arr1.first <= arr2.first ? arr1.shift : arr2.shift) until arr1.empty? || arr2.empty?
  result + arr1 + arr2
end
p merge_sort(array)
