class ComputerPlayer
  def codemaker
    secret_code = []

    4.times do
      secret_code.push(%w[1 2 3 4 5 6].sample)
    end
    secret_code
  end
end
