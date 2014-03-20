require './lib/stops'
require './lib/stations'
require './lib/train_lines'
require 'pg'

DB = PG.connect({:dbname => 'train_system'})

def main_menu
  puts "Welcome to the train system app"
  puts "Press 's' To go to the train stations menu"
  puts "Press 'l' To go to the train lines menu"
  puts "Press 'w' To go to the Stop  menu"
  puts "Press 'x' to exit"

  main_menu_choice = gets.chomp.downcase

  case main_menu_choice
  when "s"
      station_menu
  when "l"
      line_menu
  when 'w'
      stops_menu
  when "x"
     puts "Goodbye"
  else
    puts "That is a invalid option"
    main_menu
  end
end

def station_menu
  puts " WELCOME TO THE STATIONS MENU \n\n"
  puts "Press 'a' to add a station"
  puts "Press 'l' to list the stations"
  puts "Press 'm' to return to main menu"
  puts "Press 'x' to exit"
  station_menu_choice = gets.chomp.downcase
  case station_menu_choice
    when 'a'
      add_stations
    when 'l'
      list_stations
    when 'm'
      main_menu
    when 'x'
      puts "Goodbye"
    else
      puts "That is not a valid option"
      station_menu
  end
end

def add_stations
  puts "Enter the name of the new station:"
  new_station_name = gets.chomp.to_s
  new_station = Stations.new({'name' => new_station_name})
  new_station.save
  puts "New station added.\n"
  station_menu
end

def list_stations
  puts "List of all stations:"
  Stations.all.each_with_index do |station,index|
   puts "#{index +1}: #{station.name}"
  end
end

def line_menu
  puts " WELCOME TO THE LINES MENU \n\n"
  puts "Press 'a' to add a line \n"
  puts "Press 'l' to list the lines \n"
  puts "Press 'e' to add stops to the lines \n"
  puts "Press 'm' to return to main menu \n"
  puts "Press 'x' to exit \n"
  line_menu_choice = gets.chomp.downcase
  case line_menu_choice
    when 'a'
      add_lines
    when 'l'
      list_lines
    when 'm'
      main_menu
    when 'x'
      puts "Goodbye"
    else
      puts "That is not a valid option"
      line_menu
  end
end

def add_lines
  puts "\n Enter the name of the new line:"
  new_line_color = gets.chomp.to_s
  new_line = Lines.new({'color' => new_line_color})
  new_line.save
  puts "New line added.\n"
  line_menu
end

def stops_menu
  puts " WELCOME TO THE STOPS MENU \n\n"
  puts "Would you like to make a new stop? Yes/No \n"
  stops_menu_choice = gets.chomp
  case stops_menu_choice
    when "Yes"
       new_stop
    when 'No'
      stops_menu
    end
  end

 def new_stop
  puts " Please enter a Line ID: "
  new_stop_line = gets.chomp.downcase
  puts "Please enter a Station ID"
  new_stop_station = gets.chomp.downcase
  stop = Stops.create({'station_id' => new_stop_station, 'line_id' => new_stop_line})
 end


def list_lines
  puts "/n List of all line:"
  Lines.all.each_with_index do |color,index|
   puts "#{index +1}: #{color.color}"
  end
  line_menu
end

main_menu
