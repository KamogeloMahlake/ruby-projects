class ComputerPlayer
  attr_accessor :used_numbers
  def initialize
    @used_numbers = []
    @numbers = %w[1 2 3 4 5 6 ] 
    @previous_guess = []
  end
  def codemaker
    secret_code = []

    4.times do
      secret_code.push(@numbers.sample)
    end
    secret_code
  end
  def codebreaker(previous_guess, feedback)
    @previous_guess.unshift(previous_guess)

    previous_guess.each do |item|
      next if self.used_numbers.include?(item)
      used_numbers.unshift(item)
    end


    @numbers.each do |item|
      if self.used_numbers.include?(item)
        @numbers.delete(item)
      end
    end
    secret_code = []
    while @previous_guess.include?(secret_code)
      case feedback
      when 0
        secret_code = Array.new(4, @numbers.sample)
      when 1
        secret_code = Array.new(3, @numbers.sample)
        secret_code = secret_code.unshift(previous_guess[0])
      when 2
        secret_code = Array.new(2, @numbers.sample)
        secret_code = secret_code.unshift(previous_guess[0])
        secret_code = secret_code.unshift(previous_guess[1])

      when 3
        secret_code = Array.new(1, @numbers.sample)
        secret_code = secret_code.unshift(previous_guess[0])
        secret_code = secret_code.unshift(previous_guess[1])
        secret_code = secret_code.unshift(previous_guess[2])
      when 4
        secret_code = previous_guess.shuffle
      else
        secret_code = []
      end
    end
    print "\n pre: #{@previous_guess}"
    secret_code
  end
end
