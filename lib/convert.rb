#!/usr/bin/env ruby
require 'csv'
require_relative 'parse.rb'

class Convert

  def initialize(input, output, prefix, suffix)
    #open the input file and read
    @input = File.new(input, 'r')
    #open the output file so we can right to it
    @output = File.new(output, 'w')
    #set the pattern according to what was the selected option
    @prefix_file = File.new(prefix, 'r')
    #open the output file so we can right to it
    @suffix_file = File.new(suffix, 'r')
    #set the pattern according to what was the selected option
    @prefixes = []
    @suffixes = []
    set_ixes
    parser_chomper
  end

  def set_ixes
    #set the preffix arrays and suffix array

    # @prefixes = ['M.', 'Mrs.', 'Mr.', 'Dr.', 'Ms.', 'Sister', "Lady"]
    # @suffixes = %w(Jr. Sr. II III IV PhD.)

    @prefix_file.each_line { |line| @prefixes << line.split[0] }
    @suffix_file.each_line { |line| @suffixes << line.split[0] }

  end

  def parser_chomper
    @input.each_line do |line|
      parsed_data = []
      line_array = line.split("\t")
      parsed_data << Parse.parse_names(@prefixes, @suffixes, line_array[0])
      parsed_data << Parse.parse_phone(line_array[1])
      parsed_data << Parse.parse_twitter(line_array[2])
      parsed_data << Parse.parse_email(line_array[3])
      @output.puts(parsed_data.join(","))
    end
  end

  # puts @input, @output, @prefix_file, @suffix_file

end
