class ComputerPlayer
  def code_creater(array)
    code = []

    loop do
      code.push(array.sample)
      return code if array.length == 4
    end
  end
   
end
