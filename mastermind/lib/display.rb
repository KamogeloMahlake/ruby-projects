# frozen_string_literal: true

class Display
  def code_colors(secret_code)
    colored_code = []
    colors = {
      '1' => "\e[41m 1 \e[0m",
      '2' => "\e[42m 2 \e[0m",
      '3' => "\e[43m 3 \e[0m",
      '4' => "\e[44m 4 \e[0m",
      '5' => "\e[45m 5 \e[0m",
      '6' => "\e[46m 6 \e[0m"
    }
    secret_code.each do |item|
      colored_code.push(colors[item])
    end
    colored_code.join('')
  end

  def clues(secret_code)
    colored_code = []
    colors = {
      '*' => "\e[41m * \e[0m",
      '?' => "\e[47m ? \e[0m"
    }
    secret_code.each do |item|
      colored_code.push(colors[item])
    end
    colored_code.join(' ')
  end
end
