require 'haml'
require 'tilt'

class TrombiGenerator
  def initialize(characters)
    @characters = characters
  end

  def generate!
    template = Tilt.new(File.join(__dir__, 'template.html.haml'))

    File.open(File.join(__dir__, 'output', 'index.html'), 'w') do |f|
      f.write(template.render(Object.new, characters: @characters))
    end
  end
end
