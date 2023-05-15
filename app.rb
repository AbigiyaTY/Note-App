# rubocop:disable all
require './manager'
require './note'

module App
  def self.run
    menu = Menu.new
    begin
      puts ' Simple Note App '.center(50, '#')
      puts 'a) Add'
      puts 'b) Edit'
      puts 'c) Delete'
      puts 'd) Show All'
      puts 'q) Quit'
      print 'Select: '
      choice = gets.chomp

      case choice
      when 'a' then menu.add
      when 'b' then menu.edit
      when 'c' then menu.delete
      when 'd' then menu.show_all
      end
    end while choice != 'q'
  end

  class Menu
    def initialize
      @manager = Manager.new
    end

    def add
      print 'Note: '
      text = gets.chomp
      note = Note.new(text)
      @manager.store(note)
    end

    def show_all
      @manager.show_all
    end

    def edit
      @manager.show_all
      entries = @manager.get_all
      if entries.length > 0
        print 'Enter the Index Number to Edit: '
        index = gets.chomp.to_i
        note = entries.fetch(index - 1)
        print 'Note: '
        text = gets.chomp
        note.set_text(text)
        @manager.store(note)
        puts 'Entry Update'.center(200, '*')
      end
    rescue Exception => e
      puts 'Invalid Input'
    end

    def delete
      @manager.show_all
      entries = @manager.get_all
      if entries.length > 0
        print 'Enter the Index Number to Delete : '
        index = gets.chomp.to_i
        note = entries.fetch(index - 1)
        @manager.delete(note)
        puts 'Entry Deleted'.center(200, '*')
      end
    rescue Exception => e
      puts 'Invalid Input'
    end
  end
end
