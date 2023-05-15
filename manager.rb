require './database'

class Manager
  def initialize
    @database = Database.new
  end

  def store(note)
    @database.store(note)
  end

  def show_all
    entries = @database.all
    puts 'No Entries Found'.center(50, '-') if entries.empty?
    entries.each_with_index do |item, index|
      puts (index + 1).to_s.center(200, '-')
      puts item
      puts ''.center(200, '-')
    end
  end

  def all
    @database.all
  end

  def delete(note)
    @database.delete(note)
  end
end
