# frozen_string_literal: true

# Load save class
class LoadSave
  def initialize(file_path)
    @file_path = file_path
  end

  def file_exists
    File.exist?(@file_path)
  end

  def save_data
    return unless file_exists

    data = JSON.parse File.read(@file_path)
    { turns: data['turns'], word: data['word'], feedback: data['feedback'], word_array: data['word_array'],
      incorrect_letters: data['incorrect_letters'] }
  end
end
