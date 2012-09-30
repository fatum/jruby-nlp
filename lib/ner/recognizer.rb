module Ner
  class Recognizer
    def initialize(serializedClassifier = nil)
      serializedClassifier ||= NER_LIBS + "/stanford/classifiers/english.all.3class.distsim.crf.ser.gz"

      @classifier = CRFClassifier.getClassifierNoExceptions(serializedClassifier)
    end

    def extract_3class(text)
      xml_response = @classifier.classifyToString(text, "xml", true)
      entities = Nokogiri::XML("<entities>#{xml_response}</entities>").xpath('//wi')
      {
        :organizations => entities.select { |el| el.attributes["entity"].to_s == "ORGANIZATION" }.map(&:content),
        :persons => entities.select { |el| el.attributes["entity"].to_s == "PERSON" }.map(&:content),
      }
    end
  end
end
