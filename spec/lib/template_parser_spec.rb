require 'spec_helper'

require_relative './../../src/lib/template_parser.rb'

describe TemplateParser do
  context 'parse simple variables' do
    it 'returns a list with found variable' do
      expect(TemplateParser.new("{{ variable }}").variables).to eq(['variable'])
    end

    it 'returns a list with all found variables' do
      expect(TemplateParser.new("{{ variable }} abc xyz {{ another_variable }}").variables).to eq(['another_variable', 'variable'])
    end

    it 'returns a list with variables and fallback values' do
      expect(TemplateParser.new("{{ variable }} abc xyz {{ another_variable | fallback: 'xpto' }}").variables).to eq([['another_variable', 'xpto'], ['variable']])
    end
  end
end