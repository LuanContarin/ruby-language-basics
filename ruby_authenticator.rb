
@users = [
  { username: "mashrur", password: "password1" },
  { username: "jack", password: "password2" },
  { username: "arya", password: "password3" },
  { username: "jonshow", password: "password4" },
  { username: "heisenberg", password: "password5" }
]

def user_exists(username)
  return @users.any? { |user| user[:username] == username }
end

def test_password(username, password)
  return @users.find { |user| user[:username] == username && user[:password] == password }
end

puts "Welcome to the authenticator"
25.times { print "-" }
puts
puts "This program will take input from the user and compare password"
puts "If password is correct, you will get back the user object"

pwd_attempts = 0
while pwd_attempts < 3
  print "Username: "
  username = gets.chomp
    
  if user_exists(username)
    pwd_attempts = 0
        
    while pwd_attempts < 3
      print "Password: "
      password = gets.chomp

      authentication = test_password(username, password)
      if (authentication)
        puts authentication
        puts "User authenticated succesfully!"
        puts
        break
      else
        puts "Credentials were not correct"
        pwd_attempts += 1
      end

      puts "Press n to quit or any other key to continue:"
      
      exit if gets.chomp == "n"

      if (pwd_attempts == 3)
        puts "You have exceeded the number of attempts"
      end
    end
  else
    puts "User not found."
    puts "Press n to quit or any other key to try again:"
    break if gets.chomp == "n"
  end
end
