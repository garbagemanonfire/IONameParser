# put your solution to code challenge 02 here

# Read the command line argument and set up for either hunting prefixes or suffixes, like this:
case ARGV[0]
  when '-p'
    # set up some regular expression for prefixes
    sorter = /^\S*/
  when '-s'
    # set up some regular expression for suffixes
    sorter = /\S*$/
  else
    puts "unknown option"
    puts "usage: analyze.rb -p | -s < input_file > output_file"
    exit
end

# throw away the command line option in ARGV so we can get to STDIN
ARGV.shift


# go through STDIN line by line
#   use the regular expression to find the right word
#   count the word using a hash

histogram = Hash.new(0)

while line = gets
  hack_line = (/(\d+|\W)(.)(\d+)(\d)/).match(line)
  parts_of_name = hack_line.pre_match
  parts_of_name.strip!
  linestore = (sorter).match(parts_of_name).to_s
  histogram[linestore.to_sym] += 1
end


# after you've read all the lines, sort the hash so the most frequent words are first

histogram = Hash[histogram.sort_by { |linestore, count| count }.reverse]

# write the hash to STDIN

histogram.each { |linestore, count| puts "#{linestore} #{count}" }