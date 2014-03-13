require 'spec_helper'


describe "convert" do

  it "convert the data and consult prefix and suffix files" do
    `txt2csv convert -p prefixfile.txt -s suffixfile.txt -i textfile.txt -o namefile.csv`
    IO.read('namefile.csv').should == IO.read('spec/expected_output.csv')
  end


end