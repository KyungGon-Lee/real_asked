def hello
  puts "hello"
  yield
  puts "welcome"
end

# hello
hello { puts "koko" ; puts "Today I'am cold" }

# [1, 2, 3].each { puts "hello" }
