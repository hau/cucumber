require 'cucumber/smart_ast/tags'

module Cucumber
  module SmartAst
    class Feature
      include Tags

      attr_accessor :language, :features

      def initialize
        @scenarios = []
        @scenario_outlines = []
      end

      def feature(name, description, line)
        @name, @description, @line = name, description, line
      end

      def background(background=nil)
        @background || (@background = background)
      end

      def scenario(scenario)
        @scenarios << scenario
        scenario
      end

      def scenario_outline(scenario_outline)
        @scenario_outlines << scenario_outline
        scenario_outline
      end

      def examples(examples)
        @scenario_outlines.last.examples(examples)
      end

      def adverbs
        @language.adverbs
      end
    end
  end
end
