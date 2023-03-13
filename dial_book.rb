dial_book = {
  "newyork" => "212",
  "newbrunswick" => "732",
  "edison" => "908",
  "plainsboro" => "609",
  "sanfrancisco" => "301",
  "miami" => "305",
  "paloalto" => "650",
  "evanston" => "847",
  "orlando" => "407",
  "lancaster" => "717"
}

def get_city_names(somehash)
  somehash.keys
end

def get_area_code(somehash, key)
  somehash[key]
end

# main

loop do
  print "Do you want to lookup an area code based on a city name?(Y/N) "
  input = gets.chomp.downcase

  break if input != "y"

  puts "Which city do you want the area code for?"
  puts get_city_names(dial_book)

  puts "\nEnter your selection"
  city_name = gets.chomp

  if dial_book.include?(city_name)
    puts "The area code for #{city_name} is #{get_area_code(dial_book, city_name)}"
  else
    puts "You entered an invalid city name."
  end
end