# frozen_string_literal: true

require 'simplecov'
require 'simplecov-json'

module SimpleCov
 module Formatter
   class MergedFormatter
     def format(result)
       SimpleCov::Formatter::HTMLFormatter.new.format(result)
       SimpleCov::Formatter::JSONFormatter.new.format(result)
     end
   end
 end
end
SimpleCov.formatter = SimpleCov::Formatter::MergedFormatter

SimpleCov.start
