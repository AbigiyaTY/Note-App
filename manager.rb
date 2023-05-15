# rubocop:disable all
require './database'

class Manager
  def initialize
    @database = Database.new
  end

  def store(note)
    @database.store(note)
  end

  def show_all
    entries = @database.get_all
    puts 'No Entries Found'.center(50, '-') if entries.empty?
    entries.each_with_index do |item, index|
      puts (index + 1).to_s.center(200, '-')
      puts item
      puts ''.center(200, '-')
    end
  end

  def get_all
    @database.get_all
  end

  def delete(note)
    @database.delete(note)
  end
end
