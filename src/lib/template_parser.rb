class TemplateParser
  VARIABLES = /{{\s?([\w]*)\s?(\|\s?fallback:\s?'[\w ]*'\s?)?}}/
  FALLBACK = /\|\s?fallback:\s?'([a-z0-9_]+)'\s?/

  attr_accessor :variables

  def initialize(template)
    @template = template
    parse_variables
  end
  
  private
  
  def parse_variables
    @variables ||= @template.scan(VARIABLES).map do |variable, fallback|
      if fallback.nil?
        [variable, nil]
      else
        fallback_value = fallback.match(FALLBACK).captures.first
        [variable, fallback_value]
      end
    end
  end

end