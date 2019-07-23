require 'json'
module Jekyll
    class GuideGenerator < Generator
      safe true
      
      def generate(site)
        site.pages << GuidePage.new(site, site.source, episodes(site))
        site.pages << GraphPage.new(site, site.source, episodes(site))
      end
      def season_length(season_number)
        season_lengths = [0, 19, 26, 26, 25, 26, 26, 25] #hack
        season_lengths[season_number]
      end
      def episodes(site)
        episode_list = site.collections['reviews'].docs.find_all{|review| review.data.key?('episode')}
        episode_list.map do |episode|
            {
                'name' => episode.data['name'],
                'number' => episode.data['episode'],
                'season' => episode.data['season'],
                'season_length' => season_length(episode.data['season']),
                'score' => score_name(episode.data['score']),
                'importance' => importance_name(episode.data['importance']),
                'suggestion' => suggestion(episode.data['score'], episode.data['importance']),
                'comment' => episode.data['guide_comment'],
                'permalink' => episode.data['permalink']
            }
        end
      end
      
      def score_name(score)
        return "מצויין" if score == 5
        return "טוב" if score == 4
        return "סביר" if score == 3
        return "גרוע" if score == 2
        return "זוועת עולם" if score == 1
      end

      def importance_name(importance)
        return "מאוד חשוב" if importance == 2
        return "קצת חשוב" if importance == 1
        return "לא חשוב" if importance == 0
      end
      def suggestion(score, importance)
        return "must_watch" if score == 5 
        return "should_watch" if score == 4 or importance == 2
        return "can_watch" if score == 3 or importance == 1
        return "can_skip" if score == 2
        return "should_skip" if score == 1
      end
    end
  
    # A Page subclass used in the `CategoryPageGenerator`
    class GuidePage < Page
      def initialize(site, base, episodes)
        @site = site
        @base = base
        @dir  = ''
        @name = 'guide.html'
  
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'guide.html')
        self.data['episodes'] = episodes
        # self.data['category'] = category
  
        # category_title_prefix = site.config['category_title_prefix'] || 'Category: '
        # self.data['title'] = "#{category_title_prefix}#{category}"
      end
    end

    class GraphPage < Page
      def initialize(site, base, episodes)
        @site = site
        @base = base
        @dir  = ''
        @name = 'graph.html'
  
        self.process(@name)
        self.read_yaml(File.join(base, '_layouts'), 'episode_graph.html')
        self.data['episodes'] = episodes
        episode_list = site.collections['reviews'].docs.find_all{|review| review.data.key?('episode')}
        episode_nodes = episode_list.map do |episode|
          {
              'name' => episode.data['name'],
              'score' => episode.data['score'] - 1,
              'importance' => episode.data['importance'],
              'suggestion' => episode.data['score'] + 2*episode.data['importance']
          }
      end
        graph_data = {
          "nodes" => episode_nodes,
          "links" => [{"source" => "Dax", "target": "Babel"}, {"source" => "Vortex", "target": "Duet"}]
        }
        self.data['graph'] = JSON.generate(graph_data)
      end
    end
  end