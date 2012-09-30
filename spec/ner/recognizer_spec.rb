require 'spec_helper'

describe Ner::Recognizer do
  let!(:text) { "NamedEntity extractor founed by Stanford professor Mr.Findman" }
  let!(:recognizer) { described_class.new }

  it "should extractor named entity" do
    response = recognizer.extract_3class(text)

    response[:persons].should == ["Mr.", "Findman"]
    response[:organizations].should == ["Stanford"]
  end
end
