require 'spec_helper'
require 'parse.rb'

describe 'Phone parser' do
  it 'should parse country codes' do
    return_array = Parse.parse_phone('1-234-567-8910')
    expect(return_array[0]).to eq('1')
  end

  it 'should parse area codes' do
    return_array = Parse.parse_phone('234-567-8910')
    expect(return_array[1]).to eq('234')
  end

  it 'should parse phone prefixes' do
    return_array = Parse.parse_phone('1-234-567-8910 x456')
    expect(return_array[2]).to eq('567')
  end

  it 'should parse lines' do
    return_array = Parse.parse_phone('1-234-567-8910')
    expect(return_array[3]).to eq('8910')
  end

  it 'should parse extensions' do
    return_array = Parse.parse_phone('1-234-567-8910 x998')
    expect(return_array[4]).to eq('998')
  end

  it 'should parse whole phone numbers' do
    return_array = Parse.parse_phone('1-234-567-8910 x456')
    expect(return_array).to eq(['1', '234', '567', '8910', '456'])
  end

  it "should parse ddd-ddd-dddd xddd phone numbers" do
    return_array = Parse.parse_phone("123-456-7890 x213")
    expect(return_array).to eq(["", "123","456","7890","213"])
  end

  it "should parse (ddd)ddd-dddd xddd phone numbers" do
    return_array = Parse.parse_phone("(123)456-7890 x213")
    expect(return_array).to eq(["", "123","456","7890","213"])
  end

  it "should parse d-ddd-ddd-dddd xddd phone numbers" do
    return_array = Parse.parse_phone("3-123-456-7890 x213")
    expect(return_array).to eq(["3", "123","456","7890","213"])
  end

  it "should parse ddd.ddd.dddd xddd phone numbers" do
    return_array = Parse.parse_phone("123.456.7890 x213")
    expect(return_array).to eq(["", "123","456","7890","213"])
  end

  it "should parse ddd-ddd-dddd phone numbers" do
    return_array = Parse.parse_phone("123-456-7890")
    expect(return_array).to eq(["", "123","456","7890",""])
  end

  it "should parse (ddd)ddd-dddd phone numbers" do
    return_array = Parse.parse_phone("(123)456-7890")
    expect(return_array).to eq(["", "123","456","7890",""])
  end

  it "should parse d-ddd-ddd-dddd phone numbers" do
    return_array = Parse.parse_phone("3-123-456-7890")
    expect(return_array).to eq(["3", "123","456","7890",""])
  end

  it "should parse ddd.ddd.dddd phone numbers" do
    return_array = Parse.parse_phone("123.456.7890")
    expect(return_array).to eq(["", "123","456","7890",""])
  end

end
