require 'haml'
require 'tilt'

class TrombiGenerator
  def initialize(characters)
    @characters = characters
  end

  def generate!(filename = 'index', details = true)
    template = Tilt.new(File.join(__dir__, 'template.html.haml'))

    File.open(File.join(__dir__, 'output', filename + '.html'), 'w') do |f|
      f.write(template.render(Object.new, characters: @characters, details: details))
    end
  end
end
