module Ner
  class Recognizer
    def initialize(serializedClassifier = nil)
      serializedClassifier ||= NER_LIBS + "/classifiers/english.all.3class.distsim.crf.ser.gz"

      @classifier = CRFClassifier.getClassifierNoExceptions(serializedClassifier)
    end

    def extract_3class(text)
      xml_response = @classifier.classifyWithInlineXML(text)
      doc = Nokogiri::XML("<entities>#{xml_response}</entities>")
      {
        :organizations => doc.xpath('//ORGANIZATION').map(&:content),
        :persons => doc.xpath('//PERSON').map(&:content)
      }
    end
  end
end
