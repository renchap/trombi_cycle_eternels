class Character
  @@characters = Array.new

  attr_reader :id, :code_trombi, :name, :photo, :player_name

  def initialize(id, code_trombi, name, player_name)
    @id = id.gsub(' ', '')
    @name = name
    @code_trombi = code_trombi.to_i
    @player_name = player_name
  end

  def photo= p
    @photo = p
  end

  def self.load_from_files(photos, csv)
    # get a list of all image files
    files = Dir.glob("#{photos}**/*").select { |f| f =~ /\.(jpe?g|gif|png)/i }

    result = Array.new

    CSV.foreach(csv, headers: true) do |row|
      c = Character.new(row['Nom_Code'], row['Code trombi'], row['Nom du Personnage'], row['Nom du Joueur'])
      # find a photo from the character id
      regexp = c.photo_regexp

      photo = files.find { |f| f.match(regexp) }
      c.photo = photo if photo

      result << c
    end

    result
  end

  def photo_regexp
    f, s = @id.split('-')
    /#{f} ?[-_ ]? ?0*#{s.to_i}[^0-9]/
  end
end
