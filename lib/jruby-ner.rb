NER_LIBS = File.expand_path(File.dirname(__FILE__) + "/../src") unless defined?(NER_LIBS)
$:.unshift(NER_LIBS) unless
  $:.include?(NER_LIBS) || $:.include?(File.expand_path(NER_LIBS))

require 'java'
require "#{NER_LIBS}/stanford/stanford-ner.jar"

include_class "edu.stanford.nlp.ie.crf.CRFClassifier"

require 'nokogiri'
require 'ner/recognizer'
