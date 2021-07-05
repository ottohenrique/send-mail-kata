class TemplateParser
  VARIABLES = /{{\s?([\w]*)\s?(\|\s?fallback:\s?'[\w ]*'\s?)?}}/
  COMPONENTS = /{{\s[a-zA-Z0-9_ ]\s|\sfallback:\s'.?'\s*}}/

  attr_accessor :variables

  def initialize(template)
    @template = template
    parse_variables
  end
  
  private
  
  def parse_variables
    @variables ||= @template.scan(VARIABLES).map { |var, _| var.strip }.sort
  end

end