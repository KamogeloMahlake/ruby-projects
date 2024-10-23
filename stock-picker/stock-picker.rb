def stock_picker(array)
  stock = {buy_date: 0, sell_date: 0, profit: 0}

  array.each_with_index do |i, i_index|

    array.each_with_index do |j, j_index|
      
      if i_index != j_index && i_index < j_index
        if j > i
          if stock[:profit] < j - i
            stock[:sell_date] = j_index      
            stock[:buy_date] = i_index
            stock[:profit] = j - i
          end
        end
      end
    end
  end
  return [stock[:buy_date], stock[:sell_date]] 
end

p stock_picker([17,3,6,9,15,8,6,1,10])

            