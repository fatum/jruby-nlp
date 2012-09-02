NER_LIBS = File.dirname(__FILE__) + "/../../src" unless defined?(NER_LIBS)
$:.unshift(NER_LIBS) unless
  $:.include?(NER_LIBS) || $:.include?(File.expand_path(NER_LIBS))
require 'java'
require 'src/stanford-ner.jar'

include_class "edu.stanford.nlp.ie.crf.CRFClassifier"

require 'nokogiri'
require 'ner/recognizer'
