#!/usr/bin/env ruby
require 'csv'

class Analyze

  def initialize(input, output, pattern)
    #open the input file and read
    @input = File.new(input, 'r')
    #open the output file so we can right to it
    @output = File.new(output, 'w')
    #set the pattern according to what was the selected option
    @pattern = pattern
  end

  def pattern
    # Read the command line argument and set up for either hunting prefixes or suffixes, like this:
    case @pattern
      when '-p'
        # set up some regular expression for prefixes
        return sorter = /^[\w\.]+/
      when '-s'
        # set up some regular expression for suffixes
        return sorter = /[\w]+$/
    end
  end

  def analyze
    histogram = Hash.new(0)
    #set sorter from pattern method
    sorter = pattern

    @input.each_line do |line|
      #grab a record from the input and split it on tab
      line_array = CSV.parse_line(line, col_sep: '\t')
      #use the sorter to match in the line
      linestore = (sorter).match(line).to_s
       # count the word using a hash
      histogram[linestore.to_sym] += 1
    end

    # after you've read all the lines, sort the hash so the most frequent words are first
    histogram = Hash[histogram.sort_by { |linestore, count| count }.reverse]

    # write the hash to STDIN
    histogram.each { |linestore, count| @output.puts("#{linestore} #{count}") }

  end
end