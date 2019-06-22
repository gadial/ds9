module Jekyll
    module EpisodeIdentifierFilter
      def episode_identifier(input)
        input =~ /\/([^\/]+)\/([^\/]+)\/([^\/]+)/
        "#{$1}#{$2}"
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::EpisodeIdentifierFilter)