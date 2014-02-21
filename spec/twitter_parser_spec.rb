require 'spec_helper'
require 'parse.rb'

describe 'Twitter parser' do

  it 'should parse twitter handle' do
    return_array = Parse.parse_twitter('tigger')
    expect(return_array[0]).to eq('tigger')
  end

  it 'should parse twitter handle with @' do
    return_array = Parse.parse_twitter('@poohbear')
    expect(return_array[0]).to eq('poohbear')
  end

  it 'should parse blank handles' do
    return_array = Parse.parse_twitter('')
    expect(return_array[0]).to eq('Not Found')
  end

end
