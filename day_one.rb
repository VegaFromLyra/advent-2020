def sum(numbers)
  numbers.each do |first|
    numbers.each do |second|
      if first + second == 2020
        return first * second
      end
    end
  end
end

def sum_triple(numbers)
  numbers.each do |first|
    numbers.each do |second|
      numbers.each do |third|
        if first + second + third == 2020
          return first * second * third
        end
      end
    end
  end
end
