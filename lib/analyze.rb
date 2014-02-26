#!/usr/bin/env ruby

class Analyze

  def initialize(input, output, pattern)
    #open the input file and read
    @input = File.new(input, 'r')
    #open the output file so we can right to it
    @output = File.new(output, 'w')
    #set the pattern according to what was the selected option
    @pattern_select = pattern
  end

  def pattern_grab
    # Read the command line argument and set up for either hunting prefixes or suffixes, like this:
    case @pattern_select
    when '-p'
        # set up some regular expression for prefixes
        pattern = /^\S+/
    when '-s'
        # set up some regular expression for suffixes
        pattern = /\S*$/
    end
    pattern
  end

  def histo_maker
    histogram = Hash.new(0)
    #set sorter from pattern method
    sorter = pattern_grab


    @input.each_line do |line|
      #grab a record from the input and split it on tab
      line_array = line.split("\t")
      name_part = line_array[0].to_s
      #use the sorter to match in the line
      linestore = sorter.match(name_part).to_s
       # count the word using a hash
      histogram[linestore.to_sym] += 1
    end

    # after you've read all the lines, sort the hash so the most frequent words are first
    histogram = Hash[histogram.sort_by { |linestore, count| count }.reverse]

    # write the hash to STDIN
    histogram.each { |linestore, count| @output.puts("#{linestore} #{count}") }

  end
end