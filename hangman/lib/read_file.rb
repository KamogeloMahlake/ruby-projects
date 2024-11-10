# frozen_string_literal: true

class ReadFile
  def initialize(file)
    @contents = File.readlines(file).map(&:chomp)
  end

  def select_words
    @contents.select { |i| i.length > 4 && i.length < 13 }
  end
end
