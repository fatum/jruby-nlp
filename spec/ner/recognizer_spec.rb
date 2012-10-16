require 'spec_helper'

describe Ner::Recognizer do
  let!(:text) { "NamedEntity extractor founed by Stanford professor Mr.Findman" }
  let!(:recognizer) { described_class.new }

  it "should extractor named entity" do
    response = recognizer.extract_3class(text)

    response[:persons].should == ["Mr.Findman"]
    response[:organizations].should == ["Stanford"]
  end

  context "example from cutenews.eu" do
    let!(:text2) {
      <<-TEXT
      CAN ROB DYRDEK MAKE THE CHEERLEADING SQUAD?
      And Celebuzz has an exclusive sneak peek at host Rob Dyrdek's crack at making the squad.
How does Dyrdek stack up against the pros?
Celebuzz Single Player No Autoplay (CORE) No changes are to be made to this player
Source: MTV
      TEXT
    }

    it "should extractor named entity" do
      response = recognizer.extract_3class(text2)

      response[:persons].should == ["Celebuzz", "Rob Dyrdek"]
      response[:organizations].should == ["MTV"]
    end
  end
end
