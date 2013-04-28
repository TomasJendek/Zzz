# -*- encoding : utf-8 -*-

class ParserController < ApplicationController

  def self.regionParser
      parser = Parser.new
      parser.regionParser
  end

  def self.ambulanceParser
      parser = Parser.new
      parser.ambulanceTypeParser
  end
end
