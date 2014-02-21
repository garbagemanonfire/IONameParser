require 'spec_helper'
require 'parse.rb'

describe 'Email parser' do

  it 'should parse regular email' do
    return_array = Parse.parse_email('email@email.com')
    expect(return_array[0]).to eq('email@email.com')
  end

  it 'should parse regular email' do
    return_array = Parse.parse_email('email.poohbear@email.com')
    expect(return_array[0]).to eq('email.poohbear@email.com')
  end

  it 'should parse email without name' do
    return_array = Parse.parse_email('@tigger.com')
    expect(return_array[0]).to eq('Not Found')
  end

  it 'should parse email handle without @ or name' do
    return_array = Parse.parse_email('tigger.com')
    expect(return_array[0]).to eq('Not Found')
  end

  it 'should parse blank handles without @ or domian' do
    return_array = Parse.parse_email('poohbear')
    expect(return_array[0]).to eq('Not Found')
  end

  it 'should parse blank handles without @' do
    return_array = Parse.parse_email('poohbeartigger.com')
    expect(return_array[0]).to eq('Not Found')
  end

  it 'should parse blank handles' do
    return_array = Parse.parse_email('')
    expect(return_array[0]).to eq('Not Found')
  end

end
