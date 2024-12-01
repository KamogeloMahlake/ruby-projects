class Readfile
  def initialize(folder)
    @folder = folder

  end

  def write_html(x)
    template_letter = File.read(x)
    erb_template = ERB.new template_letter
    Dir.foreach(@folder) do |filename|
      next if filename == '.' or filename == '..'
      data = JSON.parse(File.read("#{@folder}/#{filename}"))

      data.each do |chapter|
        next if chapter["title"].include?("Nicole Bedroom Photosh")
        next if chapter["content"] == ""
        content = chapter["content"].strip
        title = chapter["title"]
        folder_name = chapter["user"] == "7530804"? "dirk_grey" : "crossedge"

        form_letter = erb_template.result(binding)

        self.save_file(form_letter, folder_name, title)
      end

    end
  end

  def save_file(form_letter, folder_name, title) 
    Dir.mkdir(folder_name) unless Dir.exist?(folder_name)

    filename = "#{folder_name}/#{title}.html"

    File.open(filename, 'w') do |file|
      file.puts form_letter
    end
  end
end
