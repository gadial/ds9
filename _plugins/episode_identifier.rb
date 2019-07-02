module Jekyll
    module EpisodeIdentifierFilter
      def episode_identifier(input)
        return "#{$1}#{$2}" if input =~ /\/([^\/]+)\/([^\/]+)\/([^\/]+)/
        return "#{$1}_#{$2}" if input =~ /\/([^\/]+)\/([^\/]+)/
      end
    end
  end
  
  Liquid::Template.register_filter(Jekyll::EpisodeIdentifierFilter)