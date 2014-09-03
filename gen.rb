require 'csv'
require 'awesome_print'
require_relative 'characters'
require_relative 'trombi_generator'

photos_path = "/Users/renchap/Google Drive/GN Agone/Support/PJ - PNJ/PJ/Photos/"
char_csv_path = "./characters.csv"



characters = Character.load_from_files(photos_path, char_csv_path)

print "Photos manquantes : "
puts  characters.select { |c| not c.photo }.map { |c| c.id }.sort.join(' ')

t = TrombiGenerator.new(characters.sort_by { |c| c.code_trombi })
t.generate!('orgas')
t.generate!('joueurs', false)
