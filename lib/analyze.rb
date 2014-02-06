# put your solution to code challenge 02 here

# Read the command line argument and set up for either hunting prefixes or suffixes, like this:
case ARGV[0]
  when '-p'
    # set up some regular expression for prefixes
  when '-s'
    # set up some regular expression for suffixes
  else
    puts "unknown option"
    puts "usage: analyze.rb -p | -s < input_file > output_file"
    exit
end

# throw away the command line option in ARGV so we can get to STDIN

# go through STDIN line by line
#   use the regular expression to find the right word
#   count the word using a hash

# after you've read all the lines, sort the hash so the most frequent words are first

# write the hash to STDIN